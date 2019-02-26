class AddCoordinatesToPartners < ActiveRecord::Migration[5.2]
  def change
    add_column :partners, :latitude, :float
    add_column :partners, :longitude, :float
  end
end
