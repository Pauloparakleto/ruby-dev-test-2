# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Player, type: :model do
  context 'when create' do
    it 'has name' do
      name = 'Madonna'
      player = described_class.create(FactoryBot.attributes_for(:player))

      expect(player.name).to eq(name)
    end

    it 'has invalid nil name' do
      player = described_class.create(name: nil)

      expect(player.valid?).to be_falsey
    end
  end

  context 'when update' do
    it 'has name' do
      name = 'Shakira'
      player = described_class.create(FactoryBot.attributes_for(:player))
      player.update(name: name)

      expect(player.reload.name).to eq(name)
    end

    it 'has invalid nil name' do
      player = described_class.create(FactoryBot.attributes_for(:player))
      player.update(name: nil)

      expect(player.valid?).to be_falsey
    end
  end
end
