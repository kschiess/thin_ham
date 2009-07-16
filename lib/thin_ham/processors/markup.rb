

# Generic markup processor that works by reading a file based on the 
# original filename, appending the markups extension. 
#
# This class is abstract, implementors should override #map_to_file and
# #process(markup), yielding target code. Using the Markup class itself
# will give you an identity transform, meaning delivering files as themselves.
#
# Example: 
#
#   class FooMarkup < Markup
#     def map_to_file(filename)
#       filename + ".foo"
#     end
#     def process(foo)
#       foo.gsub('foo', 'bar')
#     end
#   end
#
class ThinHam::Processors::Markup
  # Serves the file by processing it and then calling #serve_with_file_origin 
  # on the controller. 
  #
  def serve(file)
    markup = read_markup(map_to_file(file))
    
    process(markup)
  end
  
  # Reads markup file contents
  #
  def read_markup(file)
    File.read(file)
  end
  
  # Override these functions to implement a markup processor -----------------
  # (NOTE: Default implementation doesn't do anything and will leave files
  # unprocessed - this is interesting in its own right.)
  
  # Maps a path in the filesystem below the document root to a file that 
  # contains markup - returning the new path of the markup file. 
  #
  def map_to_file(path)
    path
  end
  
  # Processes markup into the target code. 
  #
  def process(markup)
    markup
  end
end