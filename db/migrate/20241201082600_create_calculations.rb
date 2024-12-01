class CreateCalculations < ActiveRecord::Migration[8.0]
  def change
    create_table :calculations do |t|
      t.float :bill
      t.integer :tip
      t.integer :people
      t.timestamp :created_at
    end
  end
end
