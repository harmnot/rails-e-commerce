class ChangeColumnTypeOfRulesOnUser2 < ActiveRecord::Migration[6.0]
  def change
    change_column :users, :role, :integer, using: "role::integer"
  end
end
