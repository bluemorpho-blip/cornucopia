class CornucopiasController < ApplicationController

  get "/cornucopias" do
    redirect_if_not_logged_in
      @cornucopias = Cornucopia.all
      erb :'cornucopias/index'
  end

  get "/cornucopias/new" do
    redirect_if_not_logged_in
    @error_message = params[:error]
      erb :'cornucopias/new'
  end

  post "/cornucopias" do
    redirect_if_not_logged_in

    unless Cornucopia.valid_params?(params)
      redirect "/cornucopias/new?error=invalid cornucopia"
    end
    Cornucopia.create(params)
    redirect to '/cornucopias'
  end

  get "/cornucopias/:id" do
    redirect_if_not_logged_in
    @cornucopia = Cornucopia.fing_by_id(params[:id])
    erb :'cornucopias/show'
  end

  get "/cornucopias/:id/edit" do
    redirect_if_not_logged_in
    @error_message = params[:error]
    @cornucopia = Cornucopia.find_by_id(params[:id])
    erb :'cornucopias/edit'
  end

  post "/cornucopias/:id" do
    redirect_if_not_logged_in
    @cornucopia = Cornucopia.find_by_id(params[:id])
    unless Cornucopia.valid_params?(params)
      redirect to "/cornucopias/#{@cornucopia.id}/edit?error=invalid cornucopia"
    end
    @cornucopia.update(params.select{ |key| key=="name"} )
    redirect to "/cornucopias/#{@cornucpia.id}"
  end

  delete '/cornucopias/:id/delete' do
    if logged_in?
      @cornucopia = Cornucopia.find_by_id(params[:id])
      if @cornucopia && @cornucopia.user == current_user
        @cornucopia.delete
      end
      redirect to '/coruncopias'
    else
      redirect to '/login'
    end
  end

end
