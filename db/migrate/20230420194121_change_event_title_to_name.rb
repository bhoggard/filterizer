class ChangeEventTitleToName < ActiveRecord::Migration[7.0]
  def change
    rename_column :events, :name, :title
  end
end
