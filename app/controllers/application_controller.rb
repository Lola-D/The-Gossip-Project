class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :only_signed_in
  
  helper_method :current_user, :user_signed_in?

  private

  def only_signed_in
    if !user_signed_in?
      redirect_to new_user_path
      flash[:danger] = "Tu dois te connecter avant d'avoir acces à cette section !"
    end
  end

  def only_signed_out
    redirect_to profil_path if user_signed_in?
  end

  def user_signed_in?
    !current_user.nil?
  end

  def current_user
    return nil if !session[:user_id]
    return @_user if @_user
    @_user = User.find_by_id(session[:user_id])
  end

  def is_author_gossip?
    if current_user.id != Gossip.find(params[:id]).user.id
      flash[:danger] = "Tu ne peux pas modifier ce gossip"
      redirect_to gossip_path(params[:id])
    end
  end
end