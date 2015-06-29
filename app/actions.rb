# home
get '/' do
  @posts = Post.order 'created_at DESC'
  erb :index
end

get '/signup' do
  erb :signup
end

post '/signup' do
  if params['email'].present? && params['avatar_url'].present? && params['username'].present? && params['password'].present?
    user = User.create params.slice('email', 'avatar_url', 'username', 'password')
    redirect to("/")
  else
    erb "Please complete all fields."
  end
end
