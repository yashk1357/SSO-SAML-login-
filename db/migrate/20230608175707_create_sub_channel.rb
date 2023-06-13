class CreateSubChannel < ActiveRecord::Migration[7.0]
  def change
    create_table :sub_channels do |t|
      t.string :name
      t.references :campaign_channel_mix, null: false, foreign_key: true

      t.timestamps
    end
  end
end
