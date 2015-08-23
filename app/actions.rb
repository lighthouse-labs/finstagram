helpers do
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end
end

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
    redirect to("/login")
  else
    erb :signup
  end
end

get '/login' do
  erb :login
end

post '/login' do
  @user = User.find_by username: params[:username]
  if @user && @user.password == params[:password]
    session[:user_id] = @user.id
    redirect to("/")
  else
    @error_messages = ["Could not authenticate user."]
    erb :login
  end
end

get '/logout' do
  session[:user_id] = nil
  redirect to("/")
end
