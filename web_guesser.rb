require 'sinatra'
require 'sinatra/reloader'

SECRET_NUMBER = rand(101)

get '/' do
  guess = params["guess"]
  message = guess_check(guess.to_i)
  color = color_check(message)
  erb :index, :locals => {:message => message,
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
    message.include?("You got it right!")
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

  def guess_check(guess)
    if guess > SECRET_NUMBER + 5
      "Way too high!"
    elsif guess > SECRET_NUMBER
      "Too high!"
    elsif guess == SECRET_NUMBER
      "You got it right! \n The SECRET NUMBER is #{SECRET_NUMBER}"
    elsif guess < SECRET_NUMBER - 5
      "Way to low!"
    elsif guess < SECRET_NUMBER
      "Too low!"
    end
  end
