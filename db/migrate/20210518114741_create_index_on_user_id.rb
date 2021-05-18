class CreateIndexOnUserId < ActiveRecord::Migration[6.1]
  def change
    add_index :multiplayer_games, :user_id
  end
end
