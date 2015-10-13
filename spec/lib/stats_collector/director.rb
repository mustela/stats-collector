require 'spec_helper'

RSpec.describe StatsCollector::Director do
  describe '.play' do
    it { expect { StatsCollector::Director.class.name }.to eq('Director') }
  end
end
