ENV["RACK_ENV"] = "development"
require 'sinatra/base'
require_relative './data_mapper_setup'
require_relative './models/link.rb'
require_relative './models/tag.rb'

class BookMarkManager < Sinatra::Base

  get '/' do
    erb(:main)
  end

  get '/links' do
    @links = Link.all
    erb(:links)
  end

  get '/links/new' do
    erb(:'links/new')
  end

  post '/links' do
    link = Link.create(url: params[:url], title: params[:title])
    tag = Tag.new(name: params[:tags])
    link.tags << tag
    link.save
    redirect to('/links')
  end

  get '/tags/:name' do
    tag = Tag.first(name: params[:name])
    @links = tag ? tag.links : []
    erb(:links)
  end

end
