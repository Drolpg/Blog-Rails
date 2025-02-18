class CreateMembers < ActiveRecord::Migration[8.0]
  def change
    create_table :members do |t|
      t.string :name
      t.integer :age
      t.integer :number

      t.timestamps
    end
  end
end
