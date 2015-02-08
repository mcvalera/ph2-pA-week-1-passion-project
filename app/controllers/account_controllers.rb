
get '/accounts/login' do
  erb :login
end

post '/accounts/login' do
  user = User.find_by(email: params[:email])
  db_password = user.password
  if db_password == params[:password]
    session[:current_user_id] = user.id
    redirect ('/accounts/' + user.username)
  else
    # HOW TO STAY IN FORM WITH ENTRIES BUT DISPLAY ERRORS??
    "Your email or password did not match. Please try again."
    redirect ('/accounts/login')
  end
end

get '/accounts/:username/albums' do
  "view all albums"
end

# TEST THIS LATER
get '/accounts/:username/edit' do
  @user = session_current_user
  erb :edit_account
end

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
  # @name = session_current_user.first_name
  # @username  = session_current_user.username
  erb :profile
end