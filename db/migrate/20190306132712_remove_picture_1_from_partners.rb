class RemovePicture1FromPartners < ActiveRecord::Migration[5.2]
  def change
    remove_column :partners, :picture_1, :string
    remove_column :partners, :picture_2, :string
    remove_column :partners, :picture_3, :string
    remove_column :partners, :product, :string
  end
end
