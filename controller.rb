require 'sinatra'
require 'sinatra/contrib/all'
require_relative 'models/bookmark'

# INDEX
get '/bookmarks' do
  @bookmarks = Bookmark.all()
  erb(:index)
end

# NEW
get '/bookmarks/new' do
  erb(:new)
end

# CREATE
post '/bookmarks' do
  @bookmark = Bookmark.new( params )
  @bookmark.save
  redirect to('/bookmarks')
end

# EDIT
get '/bookmarks/:id/edit' do
  @bookmark = Bookmark.find( params['id'] )
  erb(:edit)
end

# UPDATE
post '/bookmarks/:id' do
  @bookmark = Bookmark.update( params )
  redirect to('/bookmarks')
end

# post '/pizza/:id' do
#   @pizza = Pizza.update( params )
#   redirect to("pizza/#{params[:id]}")
# end

# SHOW
get '/bookmarks/:id' do
  @bookmark = Bookmark.find( params[:id] )
  erb(:show)
end

# DESTROY
post '/bookmarks/:id/delete' do
  Bookmark.destroy( params[:id] )
  redirect to('/bookmarks')
end


# # REDIRECT
get '/' do
  redirect to('/bookmarks')
end
