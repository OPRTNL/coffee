class AddDescriptionToPartners < ActiveRecord::Migration[5.2]
  def change
    add_column :partners, :description, :string
  end
end
