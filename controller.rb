require 'sinatra'
require 'sinatra/contrib/all'
require_relative 'models/bookmark'


get '/' do
  @bookmarks = Bookmark.all()
  erb :index
end

get '/new' do
  erb :new
end

post '/new' do
  @bookmark = Bookmark.new( params )
  @bookmark.save
  redirect to('/')
end

get '/edit/:id' do
  @bookmark = Bookmark.find( params['id'] )
  erb :edit
end

post '/edit/:id' do
  @bookmark = Bookmark.update( params )
  redirect to('/')
end

post '/delete/:id' do
  Bookmark.destroy( params[:id] )
  redirect to( '/pizza' )
  redirect to('/')
end

get '/:id' do
  @bookmark = Bookmark.find( params[:id] )
  erb( :show )
end

