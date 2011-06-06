class DeleteTypeFromFoodTypes < ActiveRecord::Migration
  def self.up
    remove_colum :food_types ,:type
  end

  def self.down
    add_column :food_types, :type, :string
  end
end
