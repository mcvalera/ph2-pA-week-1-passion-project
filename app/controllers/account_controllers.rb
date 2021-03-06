
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

get '/accounts/:username/edit' do
  @user = session_current_user
  erb :edit_account
end

# bugs with username
put '/accounts/:username/edit' do
  session_current_user.update_attributes(first_name: params[:first_name], last_name: params[:last_name], username: params[:username], email: params[:email], password: params[:password], img_url: params[:img_url])
  redirect ('/accounts/'+session_current_user.username)
end

get '/accounts/:username/delete' do
  @user = session_current_user
  erb :delete_confirmation
end

delete '/accounts/:username/delete' do
  current_users_tags.each { |tag| tag.delete }
  current_users_photos.each { |photo| photo.delete }
  session_current_user.delete
  session.clear
  redirect ('/')
end

get '/accounts/:username' do
  @user = session_current_user
  @photos = @user.photos
  erb :profile
end