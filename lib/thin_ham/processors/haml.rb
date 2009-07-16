
require 'haml'

require 'thin_ham/processors/markup'

class ThinHam::Processors::Haml < ThinHam::Processors::Markup
  
  # Helper class for markup evaluation. 
  #
  class Helper
    attr_reader :base_path, :haml_processor
    def initialize(base_path, haml_processor)
      @base_path, @haml_processor = base_path, haml_processor
    end
    
    def include(file)
      include_name = File.join(base_path, file)
      haml_processor.serve(include_name)
    end
    
    def with_layout(file, &block)
      include_name = File.join(base_path, file)
      haml_processor.serve(include_name) do 
        capture_haml(&block)
      end
    end
  end
  
  # Serves the file by processing it and then calling #serve_with_file_origin 
  # on the controller. 
  #
  def serve(file, &block)
    markup    = read_markup(map_to_file(file))
    base_path = File.dirname(file)
    
    process(markup, base_path, &block)
  end
  
  def map_to_file(path)
    "#{path}.haml"
  end
    
  # Processes haml into html
  #
  def process(haml, base_path, &block)
    helper = Helper.new(base_path, self)

    Haml::Engine.new(haml).render(helper, {}, &block)
  end
end