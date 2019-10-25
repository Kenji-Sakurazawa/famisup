class AddRoleToTopics < ActiveRecord::Migration[6.0]
  def change
    add_column :topics, :role, :integer, null: false, after: :title
  end
end
