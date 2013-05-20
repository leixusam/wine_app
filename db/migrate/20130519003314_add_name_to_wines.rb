class AddNameToWines < ActiveRecord::Migration
  def change
    add_column :wines, :name, :string
  end
end
