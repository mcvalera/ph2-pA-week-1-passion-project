
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

get '/accounts/:username/albums' do

end

put '/accounts/:username/edit' do
  inputs = {first_name: params[:first_name], last_name: params[:last_name], username: params[:username], email: params[:email], password: params[:password]}
  session_current_user.update_attributes(inputs)
  # WHAT NOW? erb? display confirmation?
end

# put '/article/:id/:code' do |id, password_string|
#   @article = Article.find(id)
#   @inputs = {title: params[:title],
#     price: params[:price],
#     email: params[:email],
#     description: params[:description], category_id: params[:category_id]}
#   @article.update_attributes(@inputs)
#   @changed = true
#   erb :'articles/edit'

'/accounts/:username/delete'

get '/accounts/:username' do
  "this is the user's profile page"
  @name = session_current_user.first_name
  @username  = session_current_user.username
  erb :profile
end