ActiveAdmin.register CampaignChannelMix do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
   permit_params :campaign_id, :channel_mix_id
  #
  # or
  #
  # permit_params do
  #   permitted = [:campaign_id, :channel_mix_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
end
