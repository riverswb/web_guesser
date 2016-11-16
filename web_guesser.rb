require 'sinatra'
require 'sinatra/reloader'

SECRET_NUMBER = rand(101)
get '/' do
  guess = params["guess"]
  message = guess_check(guess.to_i)
  correct_message = message_check(message)
  color = color_check(message)
  erb :index, :locals => {:number => correct_message,
                          :message => message,
                          :color => color}
end

def color_check(message)
  if correct(message)
    green
elsif not_close(message)
    dark_red
  else
    light_red
  end
end

def correct(message)
  message == "You got it right!"
end

def not_close(message)
  message.include?("Way")
end

def light_red
  color = "#FFCCCB"
end

def dark_red
  color = "#FF0000"
end

def green
  color = "#00FF00"
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
