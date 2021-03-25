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

get '/login' do
    erb(:login)
end

get '/logout' do
    session[:user_id] = nil
    redirect to('/')
end

get '/finstagram_posts/new' do
    @finstagram_post = FinstagramPost.new
    erb(:"finstagram_posts/new")
end

get '/finstagram_posts/:id' do
    @finstagram_post = FinstagramPost.find(params[:id])
    erb(:"finstagram_posts/show")
end

post '/login' do
    username    = params[:username]
    password    = params[:password]

    @user = User.find_by(username: username)

    if @user && @user.password == password
        session[:user_id] = @user.id
        redirect to('/')
    else
        @error_message = "Login Failed."
        erb(:login)
    end
end

post '/signup' do
    
    email       = params[:email]
    avatar_url  = params[:avatar_url]
    username    = params[:username]
    password    = params[:password]
    
    @user = User.new({ email: email, avatar_url: avatar_url, username: username, password: password })
    
    if @user.save
        redirect to('/login')
    else
        erb(:signup)
    end
end

post '/finstagram_posts' do 
    photo_url = params[:photo_url]

    @finstagram_post = FinstagramPost.new({ photo_url: photo_url, user_id: current_user.id })

    if @finstagram_post.save
        redirect(to('/'))
    else
        erb(:"finstagram_posts/new")
    end
end

