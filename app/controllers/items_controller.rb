class ItemsController < ApplicationController

  get "/items" do
    if logged_in?
      @items = Item.all
      erb :'items/index'
    else
      redirect '/cornucopias'
    end
  end

  get "/items/new" do
    if logged_in?
      erb :'items/new'
    else
      redirect '/cornucopias'
    end
  end

  get "/items/:id/edit" do
    if logged_in?
      @item = Item.find(params[:id])
      erb :'items/edit'
    else
      redirect '/cornucopias'
    end
  end

  post "/items/:id" do
    if logged_in?
      @item = Item.find(params[:id])
    unless Item.valid_params?(params)
      redirect to "/items/#{@item.id}/edit?error=invalid item"
    end
    @item.update(params.select{ |key| key == "name" || key == "cornucopias_id"} )
    redirect "/items/#{@item.id}"
  end

  get "/items/:id" do
    if logged_in?
      @item = Item.find(params[:id])
      redirect to '/items/show'
    end
  end

  post "/items" do
    if logged_in?
      unless Item.valid_params?(params)
        redirect "/itmes/new?error=invalid item"
    end
    Item.create(params)
    redirect "/items"
  end

  delete "/items/:id/delete" do
    if logged_in?
      @item = Item.find_by_id(params[:id])
      if @item && @item.user == current_user
        @item.delete
      end
      redirect to '/items'
    else
      redirect to '/login'
    end
  end

end
