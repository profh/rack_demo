class EnvReporter
  # All rack apps must have a call method which passes in 'env'
  def call(env)
    output = "<h3>LIST OF ENV VARIABLES:</h3><ul>"
    env.keys.each{|key| output += "<li>#{key} = #{env[key]}</li>"}
    output += "</ul>"
    # Needs to return array of three things => status, header, and response
    # response var must respond to 'each' method (i.e., be Enumerable), so 
    # place the return string in an array in this case.
    ["200", {"Content-Type" => "text/html"}, [output]]
  end
end

run EnvReporter.new
# now run with 'rackup app.ru -p 9000' in cli and verify in browser