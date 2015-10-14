before do
  @user = User.find_by(id: session[:user_id])
end

# Remove me when home page is built
get'/' do
  erb :index
end

get '/profile' do
  erb :'users/profile'
end

get'/register' do
  @user = User.new
  erb :'users/register'
end

get '/login' do
  erb :'users/login'
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
    erb :'users/login'
  end
end

post '/register' do
  @user = User.new(params[:user])
  if @user.save
    session[:user_id] = @user.id
    redirect '/'
  else
    @errors = @user.errors.full_messages
    erb :'users/register'
  end
end
