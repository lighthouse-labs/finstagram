get '/' do
    File.read(File.join('app/views', 'index.html'))
end