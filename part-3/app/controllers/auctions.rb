get '/auctions/new' do
  erb :'auctions/new'
end

post '/auctions' do
  params[:auction].merge!(user: @user, start_time: Time.now, end_time: Time.now)
  @auction = Auction.new(params[:auction])
  if @auction.save
    redirect '/profile'
  else
    @errors = @auction.errors.full_messages
    erb :'auctions/new'
  end
end

get '/auctions/:id' do
  @auction = Auction.find(params[:id])
  erb :'auctions/show'
end
