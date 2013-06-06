get '/tags/add_tag/:post_id' do
  
  @post = Post.find_by_id(params[:post_id])
  @tags = Tag.all
  p @tags.inspect
  erb :add_tag
end


get '/tags/:tag_id' do
  @tag = Tag.find_by_id(params[:tag_id])
  erb :show_tagged
end

get '/tag/:tag_name' do
  @tag = Tag.find_by_name(params[:tag_name])
  erb :show_tagged
end


post '/tags/add_tag/:post_id' do
  @post = Post.find_by_id(params[:post_id])
  @tag = Tag.find_or_create_by_name(params[:post][:name])
  if @tag.save && !@post.tags.include?(@tag)
    @post.tags << @tag
    redirect "/posts/#{@post.id}"
  else
    erb :add_tag
  end
end
