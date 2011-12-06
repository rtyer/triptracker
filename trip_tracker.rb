require 'bundler'
Bundler.require

require 'yaml' 

#App entry point
class TripTracker < Sinatra::Base; end;

require_relative 'config/config'
  
Dir.glob("app/**/*.rb").each { |r| require_relative r }

class TripTracker

  get '/' do
    File.read(File.join('public', 'index.html'))
  end
  
  get '/app' do
    File.read(File.join('public', 'app.html'))
  end
  
  get '/user' do
    users=DB[:users]
    users.insert(:email=>'ryan.tyer@gmail.com', :created_at=>Date.new, :updated_at=>Date.new)
    200
  end
  
end