class ChangeCreatedAtToDateInEntries < ActiveRecord::Migration
  def change
    remove_column :entries, :created_at
    add_column :entries, :date, :date
  end
end
