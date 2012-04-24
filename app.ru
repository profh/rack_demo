class HelloWorld
  # All rack apps must have a call method which passes in 'env'
  def call(env)
    # Needs to return array of three things => status, header, and response
    # response var must respond to 'each' method (i.e., be Enumerable), so 
    # place the return string in an array in this case.
    ["200", {"Content-Type" => "text/plain"}, ["nuqneH tera'"]]
  end
end

run HelloWorld.new
# now run with 'rackup app.ru -p 9000' in cli and verify in browser