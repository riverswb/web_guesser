require 'sinatra'
require 'sinatra/reloader'

secret = rand(101)
get '/' do
  "THE SECRET NUMBER IS #{secret}"
end
