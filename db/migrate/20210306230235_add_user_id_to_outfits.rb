class AddUserIdToOutfits < ActiveRecord::Migration[5.2]
  def change
    add_column :outfits, :user_id, :integer
  end
end
