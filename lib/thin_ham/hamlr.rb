
require 'time'
require 'rack/mime'
require 'rack/utils'

require 'thin_ham/processors/markup'
require 'thin_ham/processors/sass'
require 'thin_ham/processors/haml'

# Serves files from the docroot given in the constructor. If a file 
# ends with the file ending of a known processor (.haml or .sass), transform
# the file and serve the result of the transformation. 
#
# This is intended to be a prototyping helper and thus it performs no caching. 
#
# CAUTION: Not for WAN exposed usage, not security reviewed !!! Sensible to 
# at least the '..'-kind of attack. 
#
# CAUTION: All files are currently loaded into memory and then served. This
# is probably not what you want to use for big movies.
#
# Based on rack/file.rb
#
class ThinHam::Hamlr
  attr_reader :docroot
  def initialize(docroot)
    @docroot = docroot
  end
  
  def call(env)
    dup.request(env)
  end
  
  # Handles request - this is thread-safe. 
  #
  def request(env)
    path_info = Rack::Utils.unescape(env["PATH_INFO"])
    full_path = File.join(docroot, path_info)

    processors.each do |processor|
      mapped_path = processor.map_to_file(full_path)
      if can_serve?(mapped_path)
        return http_answer(
          processor.serve(full_path), 
          mime_type(full_path))
      end
    end

    return not_found(path_info)
  end
  
  # Returns a list of processors known to man
  #
  def processors
    [
      ThinHam::Processors::Haml.new, 
      ThinHam::Processors::Sass.new, 
      ThinHam::Processors::Markup.new   # identity transform, serving files as files
    ]
  end
  
  # Can we serve this file? 
  #
  def can_serve?(file)
    File.file?(file) && File.readable?(file)
  end
  
  # Returns the mime type (a guess!) for the given +filename+
  #
  def mime_type(filename)
    Rack::Mime.mime_type(
      File.extname(filename), 
      'text/plain')
  end
  
  # Serves body given with mime_type and modif_date. 
  #
  def http_answer(body, mime_type)
    [200, {
      'Cache-Control'  => 'max-age=0',    # turns off browser cache (hopefully)
      "Content-Type"   => mime_type,
      "Content-Length" => body.size.to_s
    }, body]
  end
  
  # Returns a 404 not found answer. 
  #
  def not_found(path)
    body = "File not found: #{path}\n"
    [404, {
      'Cache-Control'  => 'max-age=3600',
      "Content-Type" => "text/plain",
      "Content-Length" => body.size.to_s
      },
      [body]]
  end
end