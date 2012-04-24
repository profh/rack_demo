require './env_reporter'
require './time_reporter'
require './models/proverb'
require 'haml'


class KcwApp
  def call(env)
    # Get a random proverb from the proverb model
    proverb = Proverb.new.random
    # Open the home.haml template
    template = File.open("views/home.haml").read
    # Process the template and add in the proverb data
    engine = Haml::Engine.new(template)
    output = engine.render(Object.new, :proverb => proverb)
    # Return the response array expected for rack
    ["200", {"Content-Type" => "text/html"}, [output]]
  end
end


# use EnvReporter
# use TimeReporter
run KcwApp.new
# now run with 'rackup app.ru -p 9000' in cli and verify in browser