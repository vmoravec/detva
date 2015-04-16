require "sprockets"

class Assets < Sinatra::Base
  set :environment, Sprockets::Environment.new(__dir__)
  set :root, Detva.root

  configure do
    environment.append_path "#{root}/assets/javascripts"
    environment.append_path "#{root}/assets/stylesheets"
    environment.append_path "#{root}/assets/images"
    environment.css_compressor = :scss
  end

  helpers do
    def environment
      self.class.environment
    end
  end

  get "/assets" do
    environment["jquery-2.1.3.min.js"].to_s
  end
end
