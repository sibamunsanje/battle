require 'sinatra/base'

class Battle < Sinatra::Base
  enable :sessions
  #A session is a short term information store that lives on the server.
  #It allows the server to store basic pieces of information, like the name of the current user, across multiple requests.
  #In Sinatra, session is a hash, and you can set values for its keys.

  # start the server if ruby file executed directly
  #run! if app_file == $0
#end

  get '/' do
    erb :index
  end

  post '/names' do
    session[:player_1_name] = params[:player_1_name]
    session[:player_2_name] = params[:player_2_name]
    redirect '/play'
  end
#redirect '/route' will issue an 'internal GET request' within the server.
#Check your server logs when you submit the form: you'll see a POST request with the form params, followed by a GET request (the redirect).
#That internal GET request will activate the get '/play' action, which will render the play.erb view.

  get '/play' do
    @player_1_name = session[:player_1_name]
    @player_2_name = session[:player_2_name]
    erb :play
  end

  get '/attack' do
    @player_1_name = session[:player_1_name]
    @player_2_name = session[:player_2_name]
    erb :attack
  end
end
