helpers do

  def session_logged_in?
    !session[:current_user_id].blank?
  end

  def session_current_user
    user = User.find(session[:current_user_id])
    user
  end

end