class AddColumnToEntries < ActiveRecord::Migration
  def change
    add_column :entries, :created_at, :datetime
  end
end
