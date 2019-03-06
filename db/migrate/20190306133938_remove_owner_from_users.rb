class RemoveOwnerFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :profile_picture, :string
    remove_column :users, :owner, :boolean
  end
end
