# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'stats_collector/version'

Gem::Specification.new do |spec|
  spec.name          = 'stats_collector'
  spec.version       = StatsCollector::VERSION
  spec.authors       = ['Emiliano Jankowski']
  spec.email         = %w(ejankowski@gmail.com)

  spec.summary       = 'Simple stats collector for Rails applications'
  spec.description   = 'Simple stats collector for Rails applications'
  spec.homepage      = 'https://github.com/packethost/stats-collector'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.require_paths = %w(lib)
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }

  spec.add_dependency 'activesupport', '~> 4.2'
  spec.add_dependency 'activemodel'
  spec.add_dependency 'statsd-instrument'
  spec.add_dependency 'nunes'

  spec.add_development_dependency 'rake', '~> 0'
  spec.add_development_dependency 'rspec', '~> 3'
  spec.add_development_dependency 'webmock', '~> 1.20'
  spec.add_development_dependency 'rdoc', '~> 4'
  spec.add_development_dependency 'bundler', '~> 1.0'
  spec.add_development_dependency 'jeweler', '~> 2.0.1'
  spec.add_development_dependency 'simplecov', '~> 0'
  spec.add_development_dependency 'rubocop', '~> 0'
  spec.add_development_dependency 'sinatra', '~> 1.4'
end
