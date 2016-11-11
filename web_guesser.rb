require 'sinatra'
require 'sinatra/reloader'

SECRET_NUMBER = rand(101)
get '/' do
  guess = params["guess"]
  message = guess_check(guess.to_i)
  correct_message = message_check(message)
  erb :index, :locals => {:number => correct_message, :message => message}
end

def message_check(message)
  if message == "You got it right!"
    "The SECRET NUMBER is #{SECRET_NUMBER}"
  else
    nil
  end
end

def guess_check(guess)
  if guess > SECRET_NUMBER + 5
    "Way too high!"
  elsif guess > SECRET_NUMBER
    "Too high!"
  elsif guess == SECRET_NUMBER
    "You got it right!"
  elsif guess < SECRET_NUMBER - 5
    "Way to low!"
  elsif guess < SECRET_NUMBER
    "Too low!"
  end
end
