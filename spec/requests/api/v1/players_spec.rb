# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Api V1 Players', type: :request do
  let!(:player) { FactoryBot.create(:player) }
  it 'gets index and returns http success' do
    get api_v1_players_path
    expect(response).to have_http_status(:success)
  end

  it 'gets show and returns http success' do
    get api_v1_player_path(player.id)
    expect(response).to have_http_status(:success)
  end

  it 'returns http success' do
    post api_v1_players_path, params: { player: FactoryBot.attributes_for(:player) }
    expect(response).to have_http_status(:success)
  end

  it 'puts and returns http ok' do
    put api_v1_player_path(player.id), params: { player: FactoryBot.attributes_for(:player) }
    expect(response).to have_http_status(:ok)
  end

  it 'deletes and returns http ok' do
    delete api_v1_player_path(player.id)
    expect(response).to have_http_status(:ok)
  end
end
