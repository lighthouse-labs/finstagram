# home
get '/' do
  @posts = Post.order 'created_at DESC'
  erb :index
end

get '/signup' do
  @user = User.new
  erb :signup
end

post '/signup' do
  @user = User.new params.slice('email', 'avatar_url', 'username', 'password')
  if @user.save
    redirect to("/")
  else
    erb :signup, errors: @user.errors
  end
end
