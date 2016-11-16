require 'sinatra'
require 'sinatra/reloader'

@@secret_number = rand(101)
@@guess_count = 0

get '/' do
  reset if @@guess_count == 5
  guess = params["guess"]
  @@guess_count += 1
  message = guess_check(guess.to_i)
  color = color_check(message)
  erb :index, :locals => {:message => message,
                          :color => color}
  end

  def reset
    @@guess_count = 0
    @@secret_number = rand(101)
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
    if guess > @@secret_number + 5
      "Way too high!"
    elsif guess > @@secret_number
      "Too high!"
    elsif guess == @@secret_number
      "You got it right! \n The SECRET NUMBER is #{@@secret_number}"
    elsif guess < @@secret_number - 5
      "Way to low!"
    elsif guess < @@secret_number
      "Too low!"
    end
  end
