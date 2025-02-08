ActiveAdmin.register ModuleClients::Client, as: 'client' do
  permit_params :name, :is_active, :admin_user_id

  index do
    selectable_column
    id_column
    column :name
    column :admin_user
    column :created_at
    column :updated_at
    actions
  end

  show do
    attributes_table do
      row :name
      row :admin_user
      row :is_active
      row :created_at
      row :updated_at
    end
  end

  form do |f|
    f.semantic_errors *f.object.errors.attribute_names

    f.inputs do
      f.input :name
      f.input :admin_user, as: :select, collection: AdminUser.all.map { |admin_user| [admin_user.email, admin_user.id] }
      f.input :is_active
    end

    f.actions
  end

end