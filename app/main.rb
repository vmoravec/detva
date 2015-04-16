require "sinatra"
require "slim"

class Main < Sinatra::Base
  set :views, "#{__dir__}/templates/"

  get "/" do
    slim :index
  end
end
