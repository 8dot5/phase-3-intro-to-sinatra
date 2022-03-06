require 'sinatra'

class App < Sinatra::Base
  # Add this line to set the Content-Type header for all responses
  # to indicate our server is returning a JSON-formatted string
  set :default_content_type, 'application/json'


  get '/hello' do
    '<h2>Hello <em>World</em>!</h2>'
  end

  get '/potato' do
    "<p>Boil 'em, mash 'em, stick 'em in a stew</p>"
  end

  get '/dice' do
    dice_roll = rand(1..6)
    "<h2>You rolled a #{dice_roll}</h2>"
  end

  # method to convert a Ruby hash or array to a valid JSON string
  get '/dice_to_json' do
    dice_roll = rand(1..6)
    { roll: dice_roll }.to_json
  end

  # dynamic routes
  # :num1 and :num2 are named parameters
  # The other benefit of using this syntax is that we get access to additional data from the url in a special variable known as the params hash.
  # For example, a GET /add/1/2 request would result in a params hash that looks like this: {"num1"=>"1", "num2"=>"2"}

  get '/add/:num1/:num2' do
    num1 = params[:num1].to_i
    num2 = params[:num2].to_i

    sum = num1 + num2
    { result: sum }.to_json
  end

  #  route that returns a specific Game from the games table, formatted as JSON, using very similar code to what we used above
  get '/games/:id' do
    game = Game.find(params[:id])
    game.to_json
  end

  
end

run App
