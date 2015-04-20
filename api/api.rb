require "grape"

class Api < Grape::API
  prefix "api"
  version "v1"
  format "json"
  cascade false

  get "test" do
    { message: "test" }
  end

  route :any, '*path' do
    error! "Not found", 404
  end
end
