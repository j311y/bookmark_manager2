require "data_mapper"
require "sinatra/base"
require_relative 'data_mapper_setup'

  class BookmarkManager < Sinatra::Base
    ENV['RACK_ENV'] ||= 'development'
    get '/links/index' do
      @link = Link.all
      erb :'links/index'
    end

    get '/links/new' do
      erb :'links/new'
    end

    post '/links/index' do
      link = Link.new(title: params[:page_name],
                      url: params[:page_url])
      params[:tags].split.each do |tag|
              link.tags << Tag.first_or_create(name: tag)
      end
      link.save
      redirect '/links/index'
    end

    get '/tags/:name' do
      tag = Tag.first(name: params[:name])
      @link = tag ? tag.links : []
      erb :'links/index'
    end
  end
