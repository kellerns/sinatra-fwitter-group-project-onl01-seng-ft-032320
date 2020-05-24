class UsersController < ApplicationController

  get '/users/:slug' do
      @user = User.find_by_slug(params[:slug])
      @tweets = @user.tweets

      erb :'users/show'
  end

  get "/signup" do
    erb :'/users/create_user'
  end

  post "/signup" do
    user = User.new(params)
    if user.save
      redirect "/index"
    else
      redirect "/signup"
    end
  end

end
