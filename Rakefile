require "bundler/gem_tasks"
require 'rspec/core/rake_task'

$LOAD_PATH.unshift File.expand_path("../app", __FILE__)
$LOAD_PATH.unshift File.expand_path("../lib", __FILE__)

require "detva"

Detva.root = Pathname.new(__dir__)

require "main"
require "assets"

RSpec::Core::RakeTask.new

Dir.glob(__dir__ + "/tasks/**/*.rake").each { |task| load(task) }

