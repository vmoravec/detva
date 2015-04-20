require "logger"

$LOAD_PATH.unshift File.expand_path("../lib", __FILE__)

require "detva"

logger = Logger.new(STDOUT)

Detva.root = Pathname.new(__dir__)

require_relative "config/environment"
require_relative "app/app"
require_relative "api/api"
require_relative "assets/assets"
require_relative "websocket/app"

use Rack::CommonLogger, logger if ENV["RACK_ENV"] == "production"

run Rack::Cascade.new [Main, Assets, WebsocketServer, Api]
