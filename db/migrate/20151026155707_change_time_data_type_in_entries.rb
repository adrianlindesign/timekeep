class ChangeTimeDataTypeInEntries < ActiveRecord::Migration
  def change
    remove_column :entries, :starttime
    remove_column :entries, :endtime

    add_column :entries, :starttime, :datetime
    add_column :entries, :endtime, :datetime
  end
end
