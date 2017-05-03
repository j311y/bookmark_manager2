require "data_mapper"
require "sinatra/base"
require_relative "../app/models/link"

  class BookmarkManager < Sinatra::Base

    get '/links' do
      @link = Link.all
      erb :links
    end
  end
