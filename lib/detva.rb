require "detva/version"
require "pathname"

module Detva
  class << self
    attr_accessor :root

    attr_reader :config

    def configure
      yield config
    end
  end
end
