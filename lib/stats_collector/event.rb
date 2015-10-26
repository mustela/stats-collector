module StatsCollector
  module Event
    class << self
      def track(event)
        StatsD.increment(event)
      end
    end
  end
end
