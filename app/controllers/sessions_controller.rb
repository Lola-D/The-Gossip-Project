class SessionsController < ApplicationController

  skip_before_action :only_signed_in, only: [:new, :create]
  before_action :only_signed_out, only: [:new, :create]

  def new
  end

  def create
    user = User.find_by('email' => params[:email])
    if user && user.authenticate(params[:pw])
      session[:user_id] = user.id
      redirect_to "/"
      flash[:success] = "Tu es bien connecté !"
    else
      redirect_to new_session_path
      flash[:danger] = "Indentifiants invalides !"
    end
  end

  def destroy
    session.destroy
    redirect_to new_session_path
    flash[:success] = "Tu es bien déconnecté !"
  end
end
