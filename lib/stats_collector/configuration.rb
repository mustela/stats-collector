require 'active_model'

module StatsCollector
  class Configuration
    include ::ActiveModel::Model
    include ::ActiveModel::Validations

    attr_accessor :prefix, :statsd_address, :sample_rate

    validates! :prefix, presence: true

    def setup
      valid?
      address = @statsd_address || ENV['STATSD_ADDR']
      StatsD.backend = StatsD::Instrument::Backends::UDPBackend.new(address, :statsd) if address
      StatsD.prefix = prefix
      StatsD.default_sample_rate = (ENV['STATSD_SAMPLE_RATE'] || sample_rate || 1).to_f
    end
  end
end
