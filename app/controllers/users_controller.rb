class UsersController < ApplicationController

  get '/users/:slug' do
      @user = User.find_by_slug(params[:slug])
      @tweets = @user.tweets

      erb :'users/show'
  end

  get '/signup' do
    if logged_in?(session)
      redirect to "/tweets"
    else
      erb :'users/create_user'
    end
  end

  post '/signup' do
    @user = User.new(params)

    if @user.username == "" || @user.email == "" || @user.password == ""
      redirect to "/signup"
    elsif @user.save
      session[:id] = @user.id
      redirect to "/tweets"
    else
      redirect to "/signup"
    end
  end

end
