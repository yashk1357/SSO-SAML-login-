ActiveAdmin.register Budget do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :objective_id, :radius_id, :amount
  
 # Customizing the index view
  index do
    selectable_column
    id_column
    column :objective
    column :radius
    column :amount
    actions
  end
  
end
