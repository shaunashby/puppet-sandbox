require 'spec_helper'
describe 'sandbox' do

  context 'with defaults for all parameters' do
    it { should contain_class('sandbox') }
  end
end
