ActiveAdmin.register Article do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end

  index do
    column :title
    column :header
    column :content
    column :created_at
    column :updated_at
    column :image do |article|
      image_tag article.image.url, style: 'width: 80px; height: 80px'
    end
  end

  form do |f|
    f.inputs "Upload" do
      f.input :title
      f.input :header
      f.input :content
      f.input :created_at
      f.input :updated_at 
      f.input :image, required: true, as: :file
    end
    f.actions

    
  end
end
