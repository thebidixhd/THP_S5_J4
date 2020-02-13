class UsersController < ApplicationController
  def show
    @current_user = User.find(params[:id])
  end



  def create
    nb = rand(1..10)
    @user_create = User.new(first_name: params[:first_name], last_name: params[:last_name], email: params[:email],  age: params[:age], city_id: nb, password: params[:password], password_confirmation: params[:password_confirmation], description: params[:description])

    if @user_create.save
      log_in(@user_create)
      redirect_to root_path

    else
      render :new
    end

  end

  def new
    @user_create = User.new 

  end

  private
    def log_in(user)
      session[:user_id] = user.id
    end
end
