# frozen_string_literal: true

require 'sinatra/base'
require 'sinatra/reloader'

# Describe what the class is doing
require './lib/bookmarks'
class Bookmark < Sinatra::Base
  enable :session, :method_override
  configure :development do
    register Sinatra::Reloader
  end


  get '/' do
    'Bookmark'
  end

  get '/bookmarks' do
    @bookmarks = Bookmarks.all
    erb :bookmarks
  end
  
  get '/bookmarks/new' do
    erb :"bookmarks/new"
  end 

  post '/bookmarks' do
    Bookmarks.create(url: params['url'], title: params['title'])
    redirect '/bookmarks'
  end

  
  delete '/bookmarks/:id' do
    connection = PG.connect(dbname: 'bookmark_manager_test')
    connection.exec_params("DELETE FROM bookmarks WHERE id = $1", [params[:id]])
    redirect '/bookmarks'
  end
  
  run! if app_file == $PROGRAM_NAME
end
