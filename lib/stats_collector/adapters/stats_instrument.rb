require 'statsd-instrument'

module StatsCollector
  module Adapters
    # Internal: Memory backend for recording instrumentation calls. This should
    # never need to be used directly by a user of the gem.
    class StatsInstrument < ::Nunes::Adapter
      def initialize(client = nil)
        super
      end

      def increment(metric, value = 1)
        ::StatsD.increment(metric, value)
      end

      def timing(metric, value)
        ::StatsD.measure(metric, value)
      end
    end
  end
end
