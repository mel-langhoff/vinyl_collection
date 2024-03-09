require 'rails_helper'

RSpec.describe 'Vinyls Index Page', type: :feature do
  let(:vinyl_1) { FactoryBot.create(:vinyl) }
  let(:vinyl_2) { FactoryBot.create(:vinyl) }
  let(:vinyl_3) { FactoryBot.create(:vinyl) }

  describe 'user story 1' do
    it 'has a list of all artists alphabetically' do

    end

    it 'has a link to the vinyl show page' do
      
    end
  end
end