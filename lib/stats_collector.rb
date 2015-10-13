$LOAD_PATH.unshift File.dirname(__FILE__)

require 'nunes'
require 'stats_collector/adapters/stats_instrument'
require 'stats_collector/director'
require 'stats_collector/stats_monitor'
require 'stats_collector/railtie' if defined? Rails
