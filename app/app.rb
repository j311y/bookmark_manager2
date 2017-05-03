require "data_mapper"
require "sinatra/base"
require_relative "../app/models/link"

  class BookmarkManager < Sinatra::Base

    get '/links' do
      @link = Link.all
      erb :links
    end

    get '/links/new' do
      erb :new
    end

    post '/links' do
      @link = Link.create(title: params[:page_name], url: params[:page_url])
      redirect '/links'
    end


  end
