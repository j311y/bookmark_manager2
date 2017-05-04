require "data_mapper"
require "sinatra/base"
require_relative "../app/models/link"

  class BookmarkManager < Sinatra::Base
    ENV['RACK_ENV'] ||= 'development'
    get '/links' do
      @link = Link.all
      erb :links
    end

    get '/links/new' do
      erb :new
    end

    post '/links' do
      @link = Link.create(title: params[:page_name], url: params[:page_url], tag: params[:tag])
      redirect '/links'
    end


  end
