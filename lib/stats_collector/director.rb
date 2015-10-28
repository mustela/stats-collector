module StatsCollector
  module Director
    class << self
      def play
        Nunes.subscribe(::StatsCollector::Adapters::StatsInstrument.new)
      end
    end
  end
end
