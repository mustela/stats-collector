$LOAD_PATH.unshift File.dirname(__FILE__)

require 'nunes'
require 'stats_collector/configuration'
require 'stats_collector/adapters/stats_instrument'
require 'stats_collector/director'
require 'stats_collector/stats_monitor'
require 'stats_collector/event'

module StatsCollector
  class << self
    def configure
      yield(configuration)
      configuration.setup
      return configuration unless configuration.stats_enabled

      Director.play
      require 'stats_collector/railtie' if defined? Rails
      configuration
    end

    def configuration
      @configuration ||= Configuration.new
    end
  end
end
