require("sinatra")
require("sinatra/reloader")
also_reload("lib/**/*.rb")
require('sinatra/activerecord')
require("./lib/player")
require("./lib/team")
require("pg")
require('pry')

get('/') do
  erb(:index)
end

get('/teams') do
  @teams = Team.all()
  erb(:teams)
end

post('/teams') do
  name = params['name']
  size = params['size'].to_i
  Team.create({:name => name, :size => size})
  @teams = Team.all()
  erb(:teams)
end

get('/team/:id') do
  @team = Team.find(params['id'].to_i)
  @players = Player.all()
  erb(:players)
end
