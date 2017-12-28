class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user

  def user_sign_in?
    redirect_to '/signin', notice: "로그인이 필요합니다." if session[:user_id].nil?
  end

  def current_user
    unless session[:user_id].nil?
      @current_user = User.find(session[:user_id])
    end
    @current_user
  end
end
