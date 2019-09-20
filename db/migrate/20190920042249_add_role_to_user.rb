class AddRoleToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :role, :integer, null: false, default: 4, after: :encrypted_password
  end
end
