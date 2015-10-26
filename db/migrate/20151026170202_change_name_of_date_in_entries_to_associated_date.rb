class ChangeNameOfDateInEntriesToAssociatedDate < ActiveRecord::Migration
  def change
    rename_column :entries, :date, :entry_date
  end
end
