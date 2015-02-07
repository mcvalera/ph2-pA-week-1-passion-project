
get '/accounts/login' do
  erb :login
end

post '/accounts/login' do
  # FIGURE OUT SESSIONS
  # implement validation and authentication
  user = User.find_by(email: params[:email])
  db_password = user.password
  if db_password == params[:password]
    session[:current_user_id] = user.id
    redirect ('/accounts/' + user.username)
    "hello!"
  else
    "Your email or password did not match. Please try again."
    redirect ('/accounts/login')
  end
end


put '/accounts/edit' do

end

'/accounts/delete'


get '/accounts/:username' do
  "this is the user's profile page"
  @name = session_current_user.first_name
  @username  = session_current_user.username
  erb :profile
end

get '/accounts/:username/albums' do

end