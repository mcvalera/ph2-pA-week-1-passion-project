helpers do

  def session_logged_in?
    !session[:current_user_id].blank?
  end

  def session_current_user
    # User.find(5)
    user = User.find(session[:current_user_id])
    user
  end

end