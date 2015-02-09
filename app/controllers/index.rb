get '/' do
  @photos = Photo.all
  erb :index
end

post '/' do
  @user = User.create(first_name: params[:first_name], last_name: params[:last_name], username: params[:username], email: params[:email], password_hash: params[:password])
  if @user.save
    session[:current_user_id] = @user.id
    redirect "/accounts/#{params[:username]}"
  else
    @errors = @user.errors.full_messages
    p @errors
    erb :index
    # redirect ('/')
  end
end

get '/logout' do
  session.clear
  redirect ('/')
end

not_found do
  erb :error
end

# (first_name: params[:first_name], last_name: params[:last_name], username: params[:username], email: params[:email], password: params[:password])