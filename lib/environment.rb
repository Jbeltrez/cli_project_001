require_relative "weed_tender/version"
require_relative "weed_tender/cli"
require_relative "weed_tender/strain.rb"
require_relative "weed_tender/api.rb"

require "pry"
require "json"
require "rest-client"

module CliProject001
  class Error < StandardError; end
  # Your code goes here...
end
