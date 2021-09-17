# frozen_string_literal: true

require 'sinatra/base'
require 'sinatra/reloader'

# Describe what the class is doing
require './lib/bookmarks'
class Bookmark < Sinatra::Base
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
    Bookmarks.create(url: params['url'])
    redirect '/bookmarks'
  end
  
  run! if app_file == $PROGRAM_NAME
end
