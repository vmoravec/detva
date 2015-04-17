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
    assets.append_path "#{dir}/fonts"
    assets.css_compressor = :scss
  end

  get '/assets/*' do
    env['PATH_INFO'].sub!(%r{^/assets}, '')
    settings.assets.call(env)
  end

end
