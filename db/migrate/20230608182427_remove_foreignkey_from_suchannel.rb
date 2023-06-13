class RemoveForeignkeyFromSuchannel < ActiveRecord::Migration[7.0]
  def change
    remove_column :sub_channels, :campaign_channel_mix_id
  end
end
