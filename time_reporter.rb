class TimeReporter
  def initialize(app=nil)
    @app = app
  end
  
  def call(env)
    output = ""
    unless @app.nil?
      response = @app.call(env)[2]
      response.each{|val| output += "#{val}"}
    end
    time = Time.now
    output += "<h3>CURRENT TIME DATA:</h3>"
    output += "<p>Time: #{time.strftime('%I:%M %P')}</p>"
    output += "<p>Time Zone: #{time.strftime('%Z')}</p>"
    output += "<p>&nbsp;</p>"
    # Needs to return array of three things => status, header, and response
    # response var must respond to 'each' method (i.e., be Enumerable), so 
    # place the return string in an array in this case.
    ["200", {"Content-Type" => "text/html"}, [output]]
  end
  
  
end