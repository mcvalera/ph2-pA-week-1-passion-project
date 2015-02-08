helpers do

  def session_logged_in?
    !session[:current_user_id].blank?
  end

  def session_current_user
    User.find(session[:current_user_id])
  end

  def current_users_albums
    session_current_user.albums
  end

  def current_users_photos
    session_current_user.photos
  end

end
