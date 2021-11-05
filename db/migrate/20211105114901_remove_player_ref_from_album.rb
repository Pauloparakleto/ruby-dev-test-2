# frozen_string_literal: true

# The album had belonged to a single player before. Actually it is a many to many relationship.
# Thus not been necessary the player reference directly on album.
class RemovePlayerRefFromAlbum < ActiveRecord::Migration[5.2]
  def change
    remove_belongs_to :albums, :player, index: false
  end
end
