require 'haml'

class KcwFramework
  def initialize
    # Create a generic response object we can write to
    @response =""
  end
  
  def haml(template_name, locals)
    # Abstract out the earlier haml operations into own method 
    # (makes it easier to switch engines, etc.)
    template = File.open("views/#{template_name}.haml").read
    engine = Haml::Engine.new(template)
    engine.render(Object.new, locals)
  end
  
  def get(template, locals)
    # A method which utilizes haml method and records to response object
    @response = haml(template, locals)
  end
  
  def call(env)
     ["200",{"Content-Type" => "text/html"}, [@response]]
  end
end

