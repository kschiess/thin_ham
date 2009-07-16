
require 'sass'

require 'thin_ham/processors/markup'

class ThinHam::Processors::Sass < ThinHam::Processors::Markup
  def map_to_file(path)
    path + '.sass'
  end
    
  # Processes sass into css
  #
  def process(sass)
    Sass::Engine.new(sass).render
  end
end