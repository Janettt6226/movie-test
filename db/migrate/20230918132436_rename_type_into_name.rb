class RenameTypeIntoName < ActiveRecord::Migration[7.0]
  def change
    rename_column :genres, :type, :name
  end
end
