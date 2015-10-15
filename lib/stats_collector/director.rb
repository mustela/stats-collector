module StatsCollector
  module Director
    STATSD_REQUEST_METRICS = {
      'request.success'               => 200,
      'request.redirect'              => 302,
      'request.bad_request'           => 400,
      'request.not_found'             => 404,
      'request.too_many_requests'     => 429,
      'request.internal_server_error' => 500,
      'request.bad_gateway'           => 502
    }.freeze

    class << self
      def play
        Nunes.subscribe(::StatsCollector::Adapters::StatsInstrument.new)
        track_requests
      end

      def track_requests
        StatsdMonitor.extend(::StatsD::Instrument)

        STATSD_REQUEST_METRICS.each do |name, code|
          StatsdMonitor.statsd_count_if(:call, name) do |status, _env, _body|
            status.to_i == code
          end
        end
      end
    end
  end
end
