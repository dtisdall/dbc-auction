get "/posts" do
  @posts = Post.order("created_at DESC")
  erb :'posts/index', layout: !request.xhr?
end

get "/res/button" do
  @posts = Post.order("created_at DESC")
  erb :'posts/_newbutton', layout: !request.xhr?
end


post "/posts" do
  @post = Post.new(params[:post])

  if @post.save
    redirect "posts/#{@post.id}" unless request.xhr?
  end
end

get "/posts/new" do
  @post = Post.new
  erb :'posts/new', layout: !request.xhr?
end

get "/posts/:id" do
  @post = Post.find(params[:id])
  erb :'posts/show'
end
