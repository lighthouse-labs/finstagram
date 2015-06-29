# home
get '/' do
  @posts = Post.order 'created_at DESC'
  erb :index
end

get '/signup' do
  erb :signup
end

post '/signup' do
  user = User.create(
    email:      params[:email],
    avatar_url: params[:avatar_url],
    username:   params[:username],
    password:   params[:password]
  )
  erb user.email
end
