class UsersController < ApplicationController

  skip_before_action :only_signed_in, only: [:new, :create]
  before_action :only_signed_out, only: [:new, :create]

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end
  
  def create
    user_params = params.require(:user).permit(:first_name, :last_name, :email, :password)
    @user= User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to "/"
      flash[:success] = "Ton compte a bien été créé !"
    else
      render 'new'
    end
  end

end
