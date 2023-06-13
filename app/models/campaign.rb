class Campaign < ApplicationRecord
    has_many :channel_mixes, through: :campaign_channel_mixes
    has_many :campaign_channel_mixes
    belongs_to :objective

    has_many :sub_channels, through: :campaign_sub_channels
    has_many :campaign_sub_channels

    # accepts_nested_attributes_for :channel_mixes, allow_destroy: true
    # accepts_nested_attributes_for :campaign_channel_mixes, allow_destroy: true
end
