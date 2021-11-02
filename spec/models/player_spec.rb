# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Player, type: :model do
  context 'when create' do
    it 'has name' do
      name = 'Madonna'
      player = described_class.create(FactoryBot.attributes_for(:player))

      expect(player.name).to eq(name)
    end
  end
end
