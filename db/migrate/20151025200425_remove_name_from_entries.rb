class RemoveNameFromEntries < ActiveRecord::Migration
  def change
    remove_column :entries, :name
  end
end
