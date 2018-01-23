ENV["RACK_ENV"] = "development"
require 'sinatra/base'
require 'data_mapper'
require 'dm-postgres-adapter'
require_relative '../models/link.rb'

class BookMarkManager < Sinatra::Base

  get '/' do
    'Hello!'
  end

  get '/links' do
    @links = Link.all
    erb(:links)
  end

  get '/links/new' do
    erb(:'links/new')
  end

  post '/links' do
    Link.create(url: params[:url], title: params[:title])
    redirect to('/links')
  end
end
