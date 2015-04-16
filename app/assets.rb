class Assets < Sinatra::Base
  set :environment, Sprockets::Environment.new(__dir__)

  configure do
    environment.append_path "assets/javascripts"
    environment.append_path "assets/stylesheets"
    environment.append_path "assets/images"
  end

  helpers do
    def environment
      self.class.environment
    end
  end

  get "/assets" do
    environment['application.js']
  end
end
