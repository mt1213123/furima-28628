class CreateFurimas < ActiveRecord::Migration[6.0]
  def change
    create_table :furimas do |t|
      t.text :memo
      t.timestamps
    end
  end
end
