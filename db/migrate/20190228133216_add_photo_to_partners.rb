class AddPhotoToPartners < ActiveRecord::Migration[5.2]
  def change
    add_column :partners, :photo, :string
  end
end
