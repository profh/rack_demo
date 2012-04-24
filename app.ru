require './env_reporter'
require './time_reporter'
require './models/proverb'
require 'haml'


class KcwApp
  def call(env)
    proverb = Proverb.new.random
    template = File.open("views/home.haml").read
    engine = Haml::Engine.new(template)
    output = engine.render(Object.new, :proverb => proverb)
    ["200", {"Content-Type" => "text/html"}, [output]]
  end
end


# use EnvReporter
# use TimeReporter
run KcwApp.new
# now run with 'rackup app.ru -p 9000' in cli and verify in browser