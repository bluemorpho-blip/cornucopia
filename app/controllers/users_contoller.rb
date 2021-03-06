require 'rack-flash'

class UsersController < ApplicationController
  use Rack::Flash

  get '/users/:id' do
    if !logged_in?
    redirect '/cornucopias'
    end

    @user = User.find(params[:id])
    if @user == current_user && !@user.nil?
      erb :'users/show'
    else
      redirect '/cornucopias'
    end
  end

  get '/signup' do
    if !session[:user_id]
      erb :'/users/new'
    else
      redirect '/cornucopias/new'
    end
  end

  post '/signup' do
    if params[:username] == "" || params[:password] == ""
      redirect to '/signup'
    else
      @user = User.create(:username => params[:username], :password => params[:password])
      session[:user_id] = @user.id
      flash[:message] = "Successfully created new account."
      redirect '/cornucopias'
    end
  end

  get '/login' do
    @error_message = params[:error]
    if !session[:user_id]
      erb :'users/login'
    else
      redirect '/'
    end
  end

  post '/login' do
    user = User.find_by(:username => params[:username])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect "/"
    else
      redirect to '/signup'
    end
  end


  get '/logout' do
    if session[:user_id] != nil
      session.clear
      redirect '/login'
    else
      redirect '/'
    end
  end

end
