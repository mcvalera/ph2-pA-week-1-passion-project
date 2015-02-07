# get '/accounts/new' - index is already registration page

get '/accounts/login' do
  erb :login
end

post '/accounts/login' do
  # FIGURE OUT SESSIONS
  # implement validation and authentication
  # user = User.find_by(email: params[:email])
  # redirect ('accounts/#{user.username}')
end


get '/accounts/edit' do

end

'/accounts/delete'


get '/accounts/:username' do
  "this is the user's profile page"
end

get '/accounts/:username/albums' do

end