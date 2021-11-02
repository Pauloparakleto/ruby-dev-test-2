# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Player, type: :model do
  let!(:player) { described_class.create(FactoryBot.attributes_for(:player)) }
  let!(:name) { 'Madonna' }

  context 'when create' do
    it 'has name' do
      expect(player.name).to eq(name)
    end

    it 'has invalid nil name' do
      expect(described_class.new(name: nil).valid?).to be_falsey
    end
  end

  context 'when update' do
    it 'has name' do
      player.update(name: 'Shakira')

      expect(player.reload.name).to eq('Shakira')
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
