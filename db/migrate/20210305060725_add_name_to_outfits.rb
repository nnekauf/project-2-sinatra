class AddNameToOutfits < ActiveRecord::Migration[5.2]
  def change
    add_column :outfits, :name, :string
  end
end
