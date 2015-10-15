# encoding: utf-8

require 'rubygems'
require 'bundler'

begin
  Bundler.setup(:default, :development)
rescue Bundler::BundlerError => e
  $stderr.puts e.message
  $stderr.puts 'Run `bundle install` to install missing gems'
  exit e.status_code
end

require 'rake'
require 'jeweler'
require './lib/stats_collector/version.rb'
Jeweler::Tasks.new do |gem|
  gem.name = 'stats_collector'
  gem.homepage = 'https://github.com/packethost/stats-collector'
  gem.license = 'GPL-2.0'
  gem.summary = 'Simple stats collector for Rails applications'
  gem.description = ''
  gem.email = 'emiliano@packet.net'
  gem.authors = ['mustela']
  gem.version = StatsCollector::VERSION
  # dependencies defined in Gemfile
end
Jeweler::RubygemsDotOrgTasks.new

require 'rspec/core'
require 'rspec/core/rake_task'
RSpec::Core::RakeTask.new(:spec) do |spec|
  spec.pattern = FileList['spec/**/*_spec.rb']
end

require 'rubocop/rake_task'
RuboCop::RakeTask.new

desc 'Run the CI suite'
task ci: [:spec, :rubocop]

task default: :ci

require 'rdoc/task'
Rake::RDocTask.new do |rdoc|
  version = File.exist?('VERSION') ? File.read('VERSION') : ''

  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = "stats collector #{version}"
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end
