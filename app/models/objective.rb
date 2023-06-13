class Objective < ApplicationRecord
    has_many :channel_mixes
    has_many :campaigns 
end
