# home
get '/' do
  @posts = Post.order 'created_at DESC'
  erb :index
end

get '/signup' do
  erb :signup
end

post '/signup' do
  user = User.create params.slice('email', 'avatar_url', 'username', 'password')
  erb user.email
end
