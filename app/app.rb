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
    erb(:bookmarks)
  end
end
