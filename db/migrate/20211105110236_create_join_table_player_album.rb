# frozen_string_literal: true

# A player has many albums as well as an album belongs to many players
# In a coworking way.
# Check the has and belongs to many relationship in both models, player and album.
class CreateJoinTablePlayerAlbum < ActiveRecord::Migration[5.2]
  def change
    create_join_table :players, :albums do |t|
      t.index %i[album_id player_id]
    end
  end
end
