ENV["RACK_ENV"] = "development"
require 'sinatra/base'
require 'sinatra'
require 'sinatra/flash'
require_relative './data_mapper_setup'
require_relative './models/link.rb'
require_relative './models/tag.rb'
require_relative './models/user.rb'

class BookMarkManager < Sinatra::Base
  enable :sessions
  register Sinatra::Flash

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

  get '/users/sign_up' do
    erb(:'users/sign_up')
  end

  post '/users/sign_up' do
    user = User.new(email: params[:email], password: params[:password], password_confirmation: params[:password_confirmation])
    if user.save
      session['id'] = user.id
      redirect to('/links')
    else
      flash[:email] = params[:email]
      flash[:error] = "The passwords do not match. Please try again."
      redirect to('/users/sign_up')
    end
  end

end
