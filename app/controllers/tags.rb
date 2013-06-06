get '/tags/:tag_id' do
  @tag = Tag.find_by_id(params[:tag_id])
  erb :show_tagged
end

get '/tag/:tag_name' do
  @tag = Tag.find_by_name(params[:tag_name])
  erb :show_tagged
end

get '/tags/add_tag/:post_id' do
  @post = Post.find_by_id(params[:post_id])
  erb :add_tag
end

post '/tags/add_tag/:post_id' do
  @post = Post.find_by_id(params[:post_id])
  @tag = Tag.new(params[:post])
  if @tag.save
    @post.tags << @tag
    erb :show_post
  else
    erb :add_tag
  end
end
