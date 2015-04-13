require 'spec_helper'
describe 'sandbox2' do

  context 'with defaults for all parameters' do
    it { should contain_class('sandbox2') }
  end
end
