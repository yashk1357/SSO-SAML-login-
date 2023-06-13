class SubChannel < ApplicationRecord
    has_many :campaigns, through: :campaign_sub_channels
    has_many :campaign_sub_channels
    belongs_to :channel_mix, foreign_key: :channel_mix_id
end
