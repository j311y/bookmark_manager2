require "data_mapper"
require "sinatra/base"
require_relative "../app/models/link"

  class BookmarkManager < Sinatra::Base

    get '/links' do
      Link.all
      Link.create(title: 'Makers Academy', url: 'http://www.makersacademy.com')
      erb :links
    end
  end
