require "data_mapper"
require "sinatra/base"
require_relative 'data_mapper_setup'

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
      link = Link.new(title: params[:page_name],
                      url: params[:page_url])
      tag = Tag.first_or_create(name: params[:tags])
      link.tags << tag
      link.save
      redirect '/links'
    end


  end
