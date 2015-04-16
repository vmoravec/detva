require "sprockets"
require "sass"

class Assets < Sinatra::Base
  set :root, Detva.root
  set :assets, Sprockets::Environment.new(settings.root)

  configure do
    dir = "assets"
    assets.append_path "#{dir}/javascripts"
    assets.append_path "#{dir}/stylesheets"
    assets.append_path "#{dir}/images"
    assets.css_compressor = :scss
  end

 #get "/assets/app.js" do
 #  content_type("application/javascript")
 #  settings.assets["app"]
 #end

  get "/assets/app.css" do
    content_type("text/css")
    settings.assets["app.css"]
  end

  get '/assets/*' do
    env['PATH_INFO'].sub!(%r{^/assets}, '')
    settings.assets.call(env)
  end

  %w{jpg png}.each do |format|
    get "/assets/:image.#{format}" do |image|
      content_type("image/#{format}")
      settings.assets["#{image}.#{format}"]
    end
  end

end
