require 'rack-flash'

class CornucopiasController < ApplicationController

use Rack::Flash
  # cornucopias index
  get '/cornucopias' do
    redirect_if_not_logged_in
      @cornucopias = Cornucopia.all
      erb :'cornucopias/index'
  end

  get '/cornucopias/new' do
    redirect_if_not_logged_in
    @error_message = params[:error]
      erb :'cornucopias/new'
  end

  # edit cornucopias
  get '/cornucopias/:id/edit' do
    redirect_if_not_logged_in
    @error_message = params[:error]
    @cornucopia = Cornucopia.find(params[:id])
    if @cornucopia.user != current_user
      redirect "/cornucopias/new?error=this cornucopia does not belong to you!!"
    end
    erb :'cornucopias/edit'
  end

  post "/cornucopias/:id" do
    redirect_if_not_logged_in
    @cornucopia = Cornucopia.find(params[:id])
    unless Cornucopia.valid_params?(params)
      redirect "/cornucopias/#{@cornucopia.id}/edit?error=invalid cornucopia"
    end
    @cornucopia.update(params.select{ |k| k =="name"} )
    flash[:message] = "Successfully updated cornucopia."
    redirect "/cornucopias/#{@cornucopia.id}"
  end

  # show a cornucopia
  get "/cornucopias/:id" do
    redirect_if_not_logged_in
    @cornucopia = Cornucopia.find(params[:id])
    if @cornucopia.user != current_user
      redirect "/cornucopias/new?error=this cornucopia does not belong to you!!"
    else
      erb :'cornucopias/show'
    end
  end

  post "/cornucopias" do
    redirect_if_not_logged_in

    unless Cornucopia.valid_params?(params)
      redirect "/cornucopias/new?error=invalid cornucopia"
    end
    current_user.cornucopias.create(params)
    flash[:message] = "Successfully created cornucopia."
    redirect '/cornucopias'
  end

  # delete cornucopias
  get '/cornucopias/:id' do
    @cornucopia = Cornucopia.find_by_id(params[:id])
    erb :'cornucopias/edit'
  end

  delete '/cornucopias/:id' do
    @cornucpoia = Cornucopia.find_by_id(params[:id])
    @cornucpoia.destroy
    flash[:message] = "Successfully deleted cornucopia."
    redirect '/cornucopias'
  end

end
