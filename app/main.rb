require "sinatra"
require "slim"
require "sprockets"

class Main < Sinatra::Base
  set :views, "#{__dir__}/templates/"

  get "/" do
    name = "vmoravec"
    slim :test, locals: { name: name }
  end
end
