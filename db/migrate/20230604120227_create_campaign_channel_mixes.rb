class CreateCampaignChannelMixes < ActiveRecord::Migration[7.0]
  def change
    create_table :campaign_channel_mixes do |t|
      t.references :campaign, null: false, foreign_key: true
      t.references :channel_mix, null: false, foreign_key: true

      t.timestamps
    end
  end
end
