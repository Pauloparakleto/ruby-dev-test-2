# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Album, type: :model do
  let!(:album) { described_class.create(name: 'True Blue') }
  let!(:name) { 'True Blue' }

  context 'when create' do
    it 'has name' do
      expect(album.name).to eq(name)
    end

    it 'has invalid nil name' do
      expect(described_class.new(name: nil).valid?).to be_falsey
    end
  end

  context 'when update' do
    it 'has name' do
      album.update(name: 'X rain')

      expect(album.reload.name).to eq('X rain')
    end
  end

  context 'with many albums' do
    it 'counts three albums' do
      players = []
      3.times { players << FactoryBot.attributes_for(:player) }

      album.players.create(players)

      expect(album.reload.players.count).to eq(3)
    end
  end
end
