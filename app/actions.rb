helpers do
  def current_user
    User.find_by(id: session[:user_id])
  end
end
get '/' do
  @finstagram_posts = FinstagramPost.order(created_at: :desc)
  erb(:index)
end

get '/signup' do 
    @user = User.new 
    erb(:signup) 
end

post '/signup' do
  email      = params[:email]
  avatar_url = params[:avatar_url]
  username   = params[:username]
  password   = params[:password]

  @user = User.new({ email: email, avatar_url: avatar_url, username: username, password: password })

  if @user.save
    "User #{username} saved!"
  else
    erb(:signup)
  end
end

get '/login' do    # when a GET request comes into /login
  erb(:login)      # render app/views/login.erb
end

post '/login' do
  username = params[:username]
  password = params[:password]

  user = User.find_by(username: username)  

  if user && user.password == password
    session[:user_id] = user.id
    redirect to('/')
  else
    @error_message = "Login failed."
    erb(:login)
  end
end

post '/signup' do
  email      = params[:email]
  avatar_url = params[:avatar_url]
  username   = params[:username]
  password   = params[:password]

  @user = User.new({ email: email, avatar_url: avatar_url, username: username, password: password })

  if @user.save
    redirect to('/login')
  else
    erb(:signup)
  end
end

get '/logout' do
  session[:user_id] = nil
  redirect to('/')
end