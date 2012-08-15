require 'beanstalk-client'
SERVER_IP = '127.0.0.1'
DEFAULT_PORT = '11300'
DEFAULT_PRIORITY = 65536

task :start_beanstalk_worker do
  
  def run
    cmd = `cd ~/Sites/providers_choice && git pull`
  end
  
  beanstalk = Beanstalk::Pool.new(["#{SERVER_IP}:#{DEFAULT_PORT}"])
  loop do
    job = beanstalk.reserve
    puts job.body
    run
    job.delete
  end
end