require 'net/http'

desc "This task is called by the Heroku scheduler add-on to keep dyno awake"
task :ping_site => :environment do
  # utc is 5 hours ahead of CST
  utc_time_now = Time.now.utc
  unless ( (utc_time_now.hour >= 3)&&(utc_time_now.hour <= 12 ) )
    if ENV['URL']
      puts "Sending ping"
      uri = URI(ENV['URL'])
      Net::HTTP.get_response(uri)
      puts "success..."
    end
  end
end