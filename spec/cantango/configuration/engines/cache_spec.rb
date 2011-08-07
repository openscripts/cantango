require 'rspec'
require 'cantango'

require 'cantango/configuration/engines/store_engine_shared'

describe CanTango::Configuration::Engines::Cache do

  it_should_behave_like 'Store Engine' do
    subject { CanTango::Configuration.cache }
  end

  it_should_behave_like 'Store' do
    subject { CanTango::Configuration.cache.store }
  end
end



