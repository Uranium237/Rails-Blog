class AddAsAdminToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :asadmin, :boolean
  end
end
