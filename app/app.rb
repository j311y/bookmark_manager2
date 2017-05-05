ENV['RACK_ENV'] ||= 'development'
require "data_mapper"
require "sinatra/base"
require_relative 'data_mapper_setup'

  class BookmarkManager < Sinatra::Base
    enable :sessions
    set :session_secret, 'super secret'

    helpers do
      def current_user
        @current_user ||= User.get(session[:user_id])
      end
    end

    get '/links/index' do
      @link = Link.all

      erb :'links/index'
    end

    get '/links/new' do
      erb :'links/new'
    end

    post '/links/index' do
      link = Link.new(title: params[:page_name], url: params[:page_url])
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

    get '/sign_in' do
      erb :sign_in
    end

    post '/sign_in' do
      user = User.create(email: params[:email], password: params[:password])
      session[:user_id] = user.id
      redirect '/links/index'
    end
  end
