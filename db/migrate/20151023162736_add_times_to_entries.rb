class AddTimesToEntries < ActiveRecord::Migration
  def change
    add_column :entries, :starttime, :integer
    add_column :entries, :endtime, :integer

    remove_column :entries, :created_at
    remove_column :entries, :updated_at
  end
end
