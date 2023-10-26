class CreateEmployees < ActiveRecord::Migration[7.2]
  def change
    create_table :employees do |t|
      t.string :name
      t.integer :role, null: false, default: 0
      t.string :email
      t.references :tenant, null: false, foreign_key: true

      t.timestamps
    end
  end
end
