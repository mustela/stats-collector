module StatsCollector
  class Railtie < ::Rails::Railtie
    STATSD_TAGS = ["env:#{::Rails.env}"].freeze

    initializer 'stats_collector.insert_middleware' do |app|
      app.config.middleware.use 'StatsCollector::StatsdMonitor'
    end
  end
end
