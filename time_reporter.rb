class TimeReporter
  # Allow another app to be passed in
  def initialize(app=nil)
    @app = app
  end
  
  # All rack apps must have a call method which passes in 'env'
  def call(env)
    # Set up basic output string
    output = ""
    
    unless @app.nil?
      # if there is an app being passed in, use it's call method and 
      # get the response (third item in the response array) of the app
      response = @app.call(env)[2]
      response.each{|val| output += "#{val}"}
    end
    
    # Now add in the Time info you want to the output
    time = Time.now
    output += "<h3>Information on Current Time and Date:</h3>"
    output += "<p>Time: #{time.strftime('%I:%M %P')}</p>"
    output += "<p>Date: #{time.strftime('%B %e, %Y')}</p>"
    output += "<p>Weekday: #{time.strftime('%A')}</p>"
    output += "<p>Time Zone: #{time.strftime('%Z')}</p>"
    output += "<p>&nbsp;</p>"
    
    # Now return the basic response array...
    ["200", {"Content-Type" => "text/html"}, [output]]
  end
end