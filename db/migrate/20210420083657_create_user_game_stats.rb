class CreateUserGameStats < ActiveRecord::Migration[6.1]
  def change
    create_table :user_game_stats do |t|
      t.integer :user_id
      t.integer :wins
      t.integer :total_games
      t.integer :total_score
      t.integer :highest_score

      t.timestamps
    end
  end
end
