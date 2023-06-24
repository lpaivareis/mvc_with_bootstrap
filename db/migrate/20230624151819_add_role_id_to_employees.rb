class AddRoleIdToEmployees < ActiveRecord::Migration[7.0]
  def change
    add_reference :employees, :role, foreign_key: true
  end
end
