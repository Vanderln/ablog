get '/posts/:post_id' do
  @post = Post.find_by_id(params[:post_id])
erb :show_post
end

get '/create' do
  erb :create_post
end

get '/all_posts' do
  @posts = Post.all
  erb :all_posts
end

get '/edit/:post_id' do
  @post = Post.find_by_id(params[:post_id])
  erb :edit_post
end

get '/add_tag/:post_id' do
  @post = Post.find_by_id(params[:post_id])
  erb :add_tag
end

get '/posts/delete/:post_id' do
  @post = Post.find_by_id(params[:post_id])
  erb :confirm_delete
end

post '/posts/delete/:post_id' do
  @post = Post.find_by_id(params[:post_id])
  if params[:delete]
    @post.destroy
    @posts = Post.all
    erb :all_posts
  else
    erb :show_post
  end
end

post '/create' do
  @post = Post.new(params[:post])
  if @post.save
    erb :show_post
  else
    erb :create_post
  end
end

post '/after_edit/:post_id' do
  p params.inspect
  @post = Post.find_by_id(params[:post_id])
  @post.update_attributes(params[:post])
  if @post.save
    erb :show_post
  else
    erb :create_post
  end
end
