get '/login' do
  erb :login
end

get '/create_account' do
  erb :create_account
end

get '/users/user_page' do
  erb :user_page
end

get '/users/:user_id' do 
  @user = User.find_by_id(params[:user_id])
  erb :user_posts
end

get '/bloggers' do
  @users = User.all
  erb :bloggers
end

post '/create_user' do
  @user = User.new(params[:post])
  if @user.save
    session[:user_id] = @user.id
    redirect "/users/#{@user.id}"

  else
    erb :create_account
  end
end

post '/login' do
  @user = User.find_by_email(params[:post][:email])
  if @user
    session[:user_id] = @user.id
    redirect "/users/user_page"
  else
    erb :user_page
  end
end


