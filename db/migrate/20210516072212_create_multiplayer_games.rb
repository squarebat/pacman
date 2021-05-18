class CreateMultiplayerGames < ActiveRecord::Migration[6.1]
  def change
    create_table :multiplayer_games do |t|
      t.string :user_id
      t.string :opponent_id
      t.integer :score
      t.boolean :win
      t.datetime :time
      t.timestamps
    end
  end
end
