ENV["RACK_ENV"] = "development"
require 'sinatra/base'
require_relative './data_mapper_setup'
require_relative './models/link.rb'
require_relative './models/tag.rb'
require_relative './models/user.rb'

class BookMarkManager < Sinatra::Base
  enable :sessions

  helpers do
    def current_user
      @current_user = User.get(session['id'])
    end
  end

  get '/' do
    erb(:main)
  end

  get '/links' do
    @user = User.get(session['id'])
    @links = Link.all
    erb(:links)
  end

  get '/links/new' do
    erb(:'links/new')
  end

  post '/links' do
    link = Link.create(url: params[:url], title: params[:title])
    params[:tags].split(" ").each { |tag| link.tags << Tag.new(name: tag) }
    link.save
    redirect to('/links')
  end

  get '/tags/:name' do
    tag = Tag.first(name: params[:name])
    @links = tag ? tag.links : []
    erb(:links)
  end

  get '/sign_up' do
    erb(:sign_up)
  end

  post '/sign_up' do
    user = User.create(email: params[:email], password: params[:password], password_confirmation: params[:password_confirmation])
    session['id'] = user.id
    redirect to('/links')
  end

end
