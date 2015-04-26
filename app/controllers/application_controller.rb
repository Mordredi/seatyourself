class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def ensure_logged_in
    unless current_user
      redirect_to login_url
    end
  end

  def user_owner
    unless current_user.id == params[:id].to_i
      redirect_to restaurants_url
    end
  end

  def restaurant_owner
    unless current_user.id == Restaurant.find(params[:id]).user_id.to_i
      redirect_to restaurants_url
    end
  end


  def m_to_st(h)
    if h > 12
      (h-12).to_s + ":00 PM"
    elsif h == 12
      h.to_s + ":00 PM"
    else
      h.to_s + ":00 AM"
    end
  end

  helper_method :current_user
  helper_method :m_to_st
end
