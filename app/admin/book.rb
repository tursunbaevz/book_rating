ActiveAdmin.register Book do

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
 permit_params :name, :description, :category_id, :user, :image, author_ids: []
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end

  form do |f|
    f.inputs do
      f.input :name
      f.input :description
      f.input :category
      f.input :user
      f.input :author_ids
      f.input :image, :as => :file, :hint => image_tag(f.object.image.url(:thumb))
    end
    f.actions
  end

   index do
    selectable_column
    id_column
    column :image do |book|
      image_tag book.image.url(:thumb)
    end
    column :name do |book|
      link_to book.name, admin_book_path(book)
    end
    column :author_ids
    column :category
    column :user
    actions
  end

 show do
  attributes_table do
   row :image do |book|
     image_tag book.image.url(:medium)
   end
   row :name
   row :category
   row :author_ids
   row :description
   row :user
  end
  active_admin_comments
 end



end
