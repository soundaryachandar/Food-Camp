class AddFoodkindToFoodTypes < ActiveRecord::Migration
  def self.up
    add_column :food_types, :foodkind, :string
  end

  def self.down
    remove_column :food_types, :foodkind
  end
end
