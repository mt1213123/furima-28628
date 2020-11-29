class AddKanafirstNameToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :kanafirst_name, :string
  end
end
