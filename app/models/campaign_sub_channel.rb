class CampaignSubChannel < ApplicationRecord
    belongs_to :campaign
    belongs_to :campaign_sub_channel
end
