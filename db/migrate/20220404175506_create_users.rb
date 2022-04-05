class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :firstname
      t.string :lastname
      t.string :email
      t.references :role, null: false, foreign_key: true

      t.timestamps
    end
  end
end
