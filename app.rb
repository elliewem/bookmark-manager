require 'sinatra/base'

class BookMarkManager < Sinatra::Base
  get '/' do
    'Hello!'
  end
end
