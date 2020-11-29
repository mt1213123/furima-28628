class AddKanafamilyNameToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :kanafamily_name, :string
  end
end
