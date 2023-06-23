class CreateEmployees < ActiveRecord::Migration[7.0]
  def change
    create_table :employees do |t|
      t.string :name
      t.string :email
      t.string :register_number
      t.string :cpf

      t.timestamps
    end
  end
end
