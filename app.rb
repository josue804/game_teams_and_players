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
