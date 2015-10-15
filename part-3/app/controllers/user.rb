before do
  @user = User.find_by(id: session[:user_id])
end

# Remove me when home page is built
get'/' do
  redirect '/auctions'
end

get '/profile' do
  erb :'users/profile'
end

get'/register' do
  erb :'users/register', layout: :auth_layout
end

get '/login' do
  erb :'users/login', layout: :auth_layout
end

get '/logout' do
  session.clear
  redirect '/'
end

post '/login' do
  @user = User.authenticate(params[:user])
  if @user
    session[:user_id] = @user.id
    redirect '/'
  else
    @errors = [ "You failed to login" ]
    erb :'users/login', layout: :auth_layout
  end
end

post '/register' do
  @user = User.new(params[:user])
  if @user.save
    session[:user_id] = @user.id
    redirect '/'
  else
    @errors = @user.errors.full_messages
    erb :'users/register', layout: :auth_layout
  end
end
