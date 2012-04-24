class EnvReporter
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
    
    # Add the environmental variables to the output
    output += "<h3>LIST OF ENV VARIABLES:</h3><ul>"
    env.keys.each{|key| output += "<li>#{key} = #{env[key]}</li>"}
    output += "</ul>"
    
    # Now return the basic response array...
    ["200", {"Content-Type" => "text/html"}, [output]]
  end
end