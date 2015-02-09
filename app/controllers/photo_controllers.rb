get '/accounts/:username/new_photos' do
  @user = session_current_user
  erb :add_photo
end

post '/accounts/:username/new_photos' do
  @user = session_current_user
  @photo = Photo.create(description: params[:description], url: params[:url], user_id: @user.id)

# create tag/s if photo passes validations and is saved
  if @photo.save
    tags = params[:tag].split(", ")
    index = 0
    tags.count.times do
      Tag.create(description: tags[index], photo_id: @photo.id)
      index += 1
    end
    redirect '/accounts/'+@user.username
  else
    @errors = @photo.errors.full_messages
    erb :add_photo
  end

end