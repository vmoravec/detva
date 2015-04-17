require "grape"

class Api < Grape::API
  prefix "api"
  version "v1"
  format "json"

  get "test" do
    { message: "test" }
  end
end
