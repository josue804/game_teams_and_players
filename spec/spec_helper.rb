ENV['RACK_ENV'] = 'test'

require('sinatra/activerecord')
require 'rspec'
require 'pg'
require('./lib/player')
require('./lib/team')


RSpec.configure do |config|
  config.after(:each) do
    Player.all().each do |player|
      player.destroy()
    end
    Team.all().each do |team|
      team.destroy()
    end
  end
end
