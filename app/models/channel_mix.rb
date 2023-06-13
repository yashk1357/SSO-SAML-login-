class ChannelMix < ApplicationRecord
    has_many :campaigns, through: :campaign_channel_mixes
    has_many :campaign_channel_mixes
    belongs_to :objective
    has_many :sub_channels
end
