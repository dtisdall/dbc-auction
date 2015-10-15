get '/auctions' do
  @auctions = Auction.active
  erb :'auctions/index'
end

get '/auctions/new' do
  erb :'auctions/new'
end

post '/auctions' do
  params[:auction].merge!(user: @user, start_time: Time.now, end_time: Time.now + 1.week)
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


post '/bids' do
  bid = Bid.new(params[:bid])
  if bid.save
    redirect "/auctions/#{bid.auction.id}"
  else
    "error"
  end
end


get '/auctions/:id/edit' do
  @auction = Auction.find(params[:id])
  erb :'auctions/edit'
end

put '/auctions/:id' do
  auction = Auction.find(params[:id])
  if auction.user = @user
    auction.update_attributes(params[:auction])
    redirect "/auctions/#{auction.id}"
  else
    "error"
  end
end

delete '/auctions/:id' do
  auction = Auction.find(params[:id])
  if auction.user = @user
    auction.delete
    redirect '/profile'
  else
    "error"
  end
end