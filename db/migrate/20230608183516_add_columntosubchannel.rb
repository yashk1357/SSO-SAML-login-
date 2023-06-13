class AddColumntosubchannel < ActiveRecord::Migration[7.0]
  def change
    add_column :sub_channels, :channel_mix_id, :integer
  end
end
