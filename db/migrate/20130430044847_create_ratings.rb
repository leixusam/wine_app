class CreateRatings < ActiveRecord::Migration
  def change
    create_table :ratings do |t|
      t.integer :wine_id
      t.integer :user_id
      t.integer :overall_rating
      t.string :smell1
      t.string :smell2
      t.string :smell3
      t.string :taste1
      t.string :taste2
      t.string :taste3

      t.timestamps
    end
  end
end
