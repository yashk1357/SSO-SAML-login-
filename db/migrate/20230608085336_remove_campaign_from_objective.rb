class RemoveCampaignFromObjective < ActiveRecord::Migration[7.0]
  def change
    remove_column :objectives, :campaign_id
  end
end
