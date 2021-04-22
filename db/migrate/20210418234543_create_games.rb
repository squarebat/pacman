class CreateGames < ActiveRecord::Migration[6.1]
  def change
    create_table :games do |t|
      t.integer :score
      t.datetime :time_started
      t.boolean :win
      t.float :duration

      t.timestamps
    end
  end
end
