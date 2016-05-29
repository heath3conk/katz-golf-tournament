module SignupsHelper

  def logged_in?
    session[:user_id]
  end

  def authenticate!
    redirect_to new_session_path unless logged_in?
  end

end