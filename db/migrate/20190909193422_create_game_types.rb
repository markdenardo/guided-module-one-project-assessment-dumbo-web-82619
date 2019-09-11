class CreateGameTypes < ActiveRecord::Migration[5.2]
  def change
    create_table :game_types do |t|
      t.string :name
    end
  end
end
