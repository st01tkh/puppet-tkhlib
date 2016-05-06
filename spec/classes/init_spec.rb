require 'spec_helper'
describe 'tkhlib' do

  context 'with defaults for all parameters' do
    it { should contain_class('tkhlib') }
  end
end
