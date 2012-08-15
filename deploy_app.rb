require 'sinatra'
require 'beanstalk-client'

SERVER_IP = '127.0.0.1'
DEFAULT_PORT = '11300'
DEFAULT_PRIORITY = 65536

get '/' do
  @title = "Deploy"
  erb :index
end

post '/deploy' do
  beanstalk = Beanstalk::Pool.new(["#{SERVER_IP}:#{DEFAULT_PORT}"])
  @message = "deploy at #{Time.now}"
  beanstalk.put(message, DEFAULT_PRIORITY, 2)
  @title = "Success"
  erb :deploy
end

error do
  "Ooops.\n" + env['sinatra.error']
end