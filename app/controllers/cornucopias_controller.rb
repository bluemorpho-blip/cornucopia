class CornucopiasController < ApplicationController

  get "/cornucopias" do
    if logged_in?
      @cornucopias = Cornucopia.all
      erb :'cornucopias/index'
    else
      redirect to '/login'
    end
  end

  get "/cornucopias/new" do
    if logged_in?
      erb :'cornucopias/new'
    else
      redirect to '/login'
    end
  end


    post "/cornucopias" do
    if logged_in?
      if params[:name] == ""
        redirect to "/cornucpoias/new"
      else
        @cornucopia = current_user.cornucopias.build(name: params[:name])
        if @cornucopia.save
          redirect to "/cornucopias/#{@cornucopia.id}"
        else
          redirect to "/cornucopias/new"
        end
      end
      redirect to '/login'
    end
  end

  get "/cornucopias/:id/edit" do
    if logged_in?
      @cornucopia = Cornucopia.find_by_id(params[:id])
      if @cornucopia && @cornucopia.user == current_user
        erb :'cornucopias/edit'
      else
        redirect '/coruncopias'
      end
    else
      redirect "/login"
    end
  end

  post "/cornucopias/:id" do
    if logged_in?
      if params[:name] == ""
        redirect to "/cornucopias/#{params[:id]}/edit"
      else
        @cornucopia = Cornucopia.find_by_id(params[:id])
        if @cornucopia && @cornucopia.user == current_user
          if @cornucopia.update(item: params[:item])
            redirect to "/cornucopias/#{@cornucopia.id}"
          else
            redirect to "/cornucopias/#{@cornucopia.id}/edit"
          end
        else
        redirect to "/cornucopias"
      end
    end
  else
    redirect to "/"
  end
end

  get "/cornucopias/:id" do
    redirect_if_not_logged_in
    @cornucopia = Cornucopia.find(params[:id])
    erb :'cornucopias/show'
  end

  delete "/cornucopias/:id/delete" do
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
