
get '/accounts/login' do
  erb :login
end

post '/accounts/login' do
  user = User.find_by(email: params[:email])
  db_password = user.password_hash
  if db_password == params[:password]
    session[:current_user_id] = user.id
    redirect ('/accounts/' + user.username)
  else
    @error = "Your email or password did not match. Please try again."
    erb :login
  end
end

# TEST THIS LATER
get '/accounts/:username/edit' do
  @user = session_current_user
  erb :edit_account
end


# it doesn't work for username but somehow works with everything else. pourquoiiiiiii ;_______;
put '/accounts/:username/edit' do
  session_current_user.update_attributes(first_name: params[:first_name], last_name: params[:last_name], username: params[:username], email: params[:email], password: params[:password])
  redirect ('/accounts/'+session_current_user.username)
end

get '/accounts/:username/delete' do
  @user = session_current_user
  erb :delete_confirmation
end
  # redirect ('/accounts/'+@user.username+'/delete')

delete '/accounts/:username/delete' do
  current_users_photos.each { |photo| photo.delete }
  current_users_albums.each { |album| album.delete }
  session_current_user.delete
  session.clear
  redirect ('/')
end

get '/accounts/:username' do
  @user = session_current_user
  @photos = @user.photos
  erb :profile
end