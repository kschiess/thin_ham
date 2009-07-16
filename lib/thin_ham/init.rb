
require 'thin'

module ThinHam
  VERSION = "1.0.0"
  
  def start_server(directory='.')
    puts "serving ham in thin slices at localhost:3000... (Ctrl+C to interrupt)"
    
    Thin::Server.start('0.0.0.0', 3000) do
      use Rack::CommonLogger
      
      map '/' do 
        run ThinHam::Hamlr.new(directory)
      end
    end
  end
  module_function :start_server
  
  module Processors; end
end  

require 'thin_ham/hamlr'
