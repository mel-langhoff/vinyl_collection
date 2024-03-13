require 'rails_helper'

RSpec.describe Artist, type: :model do
  
  describe 'relationship' do
    it { should have_many(:albums) }
  end
end