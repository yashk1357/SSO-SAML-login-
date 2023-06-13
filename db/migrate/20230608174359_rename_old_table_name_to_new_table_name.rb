class RenameOldTableNameToNewTableName < ActiveRecord::Migration[7.0]
  def change
  rename_table :channle_mixes, :channel_mixes
    
  end
end
