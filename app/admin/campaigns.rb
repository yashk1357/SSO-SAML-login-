ActiveAdmin.register Campaign do

    permit_params :name, campaign_channel_mixes_attributes: [:id, :channel_mix_id]
  
   
  
  
end
