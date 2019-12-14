class UsersController < ApplicationController

  get "/users/:id" do
  @user = User.find(params[:id])
  if !@user.nil && @user == current_user
    erb :'/users/show'
  else
    redirect '/cornucopias'
  end
end

  get '/signup' do
    if logged_in?
      erb :'/users/new', locals: {message: "Please sign up before you sign in"}
    else
      redirect to '/cornucopias'
    end
  end

  post '/signup' do
    if params[:username] == "" || params[:password] == ""
      redirect to '/signup'
    else
      @user = User.new(:username => params[:username], :password => params[:password])
      @user.save
      session[:user_id] = @user.id
      redirect '/cornucopias'
    end
  end

  get '/login' do
    if !logged_in?
      erb :'users/login'
    else
      redirect '/cornucopias'
    end
  end

  post "/login" do
    user = User.find_by(:username => params[:username])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect '/cornucopias'
    else
      redirect '/signup'
    end
  end

  get '/logout' do
    if logged_in?
      session.destroy
      redirect '/login'
    else
      redirect '/'
    end
  end

end
