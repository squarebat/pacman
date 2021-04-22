class AddIndexToUserGameStats < ActiveRecord::Migration[6.1]
  def change
    add_index :user_game_stats, :user_id
  end
end
