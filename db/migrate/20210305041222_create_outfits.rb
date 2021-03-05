class CreateOutfits < ActiveRecord::Migration[5.2]
  def change
    create_table :outfits do |t|
      t.string :top
      t.string :bottom
      t.string :shoes
      t.string :accessories
    end
  end
end
