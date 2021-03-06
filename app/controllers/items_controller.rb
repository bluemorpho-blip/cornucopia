require 'rack-flash'

class ItemsController < ApplicationController

  use Rack::Flash

  get '/items' do
    redirect_if_not_logged_in
      @items = Item.find_by_id(params[:id])
      erb :'users/show'
  end

  get '/items/new' do
    redirect_if_not_logged_in
    @error_message = params[:error]
    @items = Item.all
    erb :'items/new'
  end

  # edit items
  get "/items/:id/edit" do
    redirect_if_not_logged_in
    @error_message = params[:error]
    @item = Item.find(params[:id])
    @cornucopias = Cornucopia.all
    erb :'items/edit'
  end

  post "/items/:id" do
    redirect_if_not_logged_in
    @item = Item.find(params[:id])
    unless Item.valid_params?(params)
      redirect "/items/#{@item.id}/edit?error=invalid item"
    end
    @item.update(params.select{ |k| k == "name"} )
    flash[:message] = "Successfully added #{@item.name}."
    redirect "/items/#{@item.id}"
  end

  # show items
  get '/items/:id' do
    redirect_if_not_logged_in
    @item = Item.find_by_id(params[:id])
    @cornucopia = @item.cornucopia
    erb :'/items/show'
  end

  post "/items" do
    redirect_if_not_logged_in
    unless Item.valid_params?(params)
        redirect "/items/new?error=invalid item"
    end
    Item.create(params)
    flash[:message] = "#{params[:name]} stuffed in the cornucopia!"
    redirect "/items"
  end

  # delete items
  get '/items/:id' do
    @item = Item.find_by_id(params[:id])
    erb :'/items/edit'
  end

  delete '/items/:id' do
    @item = Item.find_by_id(params[:id])
    @item.destroy
    flash[:message] = "Successfully deleted #{@item.name}"
    redirect to '/items'
  end

end
