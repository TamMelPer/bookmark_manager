# frozen_string_literal: true

require 'sinatra/base'
require './lib/bookmark.rb'

class BookmarkManager < Sinatra::Base
  get '/' do
    'Bookmark Manager'
  end

  get '/bookmarks' do
    @bookmarks = Bookmark.all
    erb :'/bookmarks/index'
  end

  get '/bookmarks/add' do
    erb :"/bookmarks/add"
  end

    post '/bookmarks' do
      Bookmark.create(url: params[:url], title: params[:title])
      redirect '/bookmarks'
  end
  # start the server if ruby file executed directly
  run! if app_file == $PROGRAM_NAME
end
