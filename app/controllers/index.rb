get '/' do
  erb :index
end

post '/' do
  @user = User.create(first_name: params[:first_name], last_name: params[:last_name], username: params[:username], email: params[:email], password: params[:password])
  if @user.save
    session[:current_user_id] = @user.id
    # does below params for email work syntax-wise?
    redirect "/accounts/#{params[:username]}"
  else
    # FIGURE OUT FLASH
    # flash[:error] =
    "That didn't work out. Please try again."
    redirect ('/')
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