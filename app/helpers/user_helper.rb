helpers do

  def session_logged_in?
    !session[:current_user_id].blank?
  end

  def session_current_user
    User.find(session[:current_user_id])
  end

  def current_users_photos
    session_current_user.photos
  end

  def current_users_tags
    session_current_user.tags
  end

end
