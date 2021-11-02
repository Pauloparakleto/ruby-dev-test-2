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
      player = described_class.new(name: nil)

      expect(player.valid?).to be_falsey
    end
  end

  context 'when update' do
    let!(:player) { described_class.create(FactoryBot.attributes_for(:player)) }

    it 'has name' do
      name = 'Shakira'
      player.update(name: name)

      expect(player.reload.name).to eq(name)
    end

    it 'has invalid nil name' do
      player.update(name: nil)

      expect(player.valid?).to be_falsey
    end
  end

  context 'with many albums' do
    it 'counts three albums' do
      albums = []
      3.times { albums << FactoryBot.attributes_for(:album) }

      player.albums.create(albums)

      expect(player.reload.albums.count).to eq(3)
    end
  end
end
