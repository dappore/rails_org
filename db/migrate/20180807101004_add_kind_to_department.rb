class AddKindToDepartment < ActiveRecord::Migration[5.2]
  def change
    add_column :departments, :kind, :string
  end
end
