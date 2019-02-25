class CreatePartners < ActiveRecord::Migration[5.2]
  def change
    create_table :partners do |t|
      t.string :name
      t.string :adress
      t.string :product
      t.references :user, foreign_key: true
      t.string :picture_1
      t.string :picture_2
      t.string :picture_3

      t.timestamps
    end
  end
end
