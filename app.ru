require './models/proverb'
require './env_reporter'
require './time_reporter'
require './kcw_framework'

class KcwApp < KcwFramework
  def initialize
    # get("home", :proverb => Proverb.new.random)
    get("index", :proverbs => Proverb.new.all)
  end
end

use EnvReporter
use TimeReporter
run KcwApp.new
# now run with 'rackup app.ru -p 9000' in cli and verify in browser