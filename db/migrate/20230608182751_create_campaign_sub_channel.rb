class CreateCampaignSubChannel < ActiveRecord::Migration[7.0]
  def change
    create_table :campaign_sub_channels do |t|
      t.string :name
      t.references :campaign, null: false, foreign_key: true
      t.references :sub_channel, null: false, foreign_key: true

      t.timestamps
    end
  end
end
