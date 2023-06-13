ActiveAdmin.register Objective do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :name
 
 # Customizing the index view
 index do
  selectable_column
  id_column
  column :name
  actions
end
end
