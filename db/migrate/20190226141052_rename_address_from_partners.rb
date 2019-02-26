class RenameAddressFromPartners < ActiveRecord::Migration[5.2]
  def change
    rename_column :partners, :adress, :address
  end
end
