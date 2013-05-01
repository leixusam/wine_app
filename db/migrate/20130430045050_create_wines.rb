class CreateWines < ActiveRecord::Migration
  def change
    create_table :wines do |t|
      t.string :winery
      t.string :varietal
      t.string :vintage

      t.timestamps
    end
  end
end
