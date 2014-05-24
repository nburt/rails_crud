class ChangeCatsToNonNullable < ActiveRecord::Migration
  def change
    change_column :cats, :name, :string, :null => false
    change_column :cats, :color, :string, :null => false
  end
end
