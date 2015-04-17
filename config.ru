$LOAD_PATH.unshift File.expand_path("../app", __FILE__)
$LOAD_PATH.unshift File.expand_path("../lib", __FILE__)

require_relative "config/environment"

require "detva"

Detva.root = Pathname.new(__dir__)

require "main"
require "assets"
require "api"

require "logger"

logger = Logger.new(STDOUT)
use Rack::CommonLogger, logger if ENV["RACK_ENV"] == "production"

run Rack::Cascade.new [Main, Assets, Api]
