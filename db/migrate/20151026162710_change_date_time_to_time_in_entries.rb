class ChangeDateTimeToTimeInEntries < ActiveRecord::Migration
  def change
    change_column :entries, :starttime, :time
    change_column :entries, :endtime, :time
  end
end
