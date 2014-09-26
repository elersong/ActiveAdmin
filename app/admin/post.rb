ActiveAdmin.register Post do
  
  scope :rails

  permit_params :title, :slug, :blurb, :content, :category_id, :image
  
  # this index call specifies which properties will be visible in the listing of all Posts within admin
  index do
    column :title
    column :slug
    column :blurb
    column :created_at
    actions
  end
  
  # this should customize the layout for a single-post page
  show do |post|
    attributes_table do
      row :id
      row :title
      row :slug
      row :blurb
      row :category
      row :content
      row :image do
        link_to(post.image.url, post.image.url)
      end
      row :image do
        image_tag(post.image.url(:thumb))
      end
    end
    active_admin_comments
  end

  form :html => {:enctype => "multipart/form-data"} do |f|
    f.inputs "Details" do
      f.input :title
      f.input :slug
      f.input :blurb
      f.input :category
      f.input :content, :as => :text
    end
    
    f.inputs "Images" do
      f.input :image, :label => 'Post Image', :as => :file
    end
    f.actions
  end

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # permit_params :list, :of, :attributes, :on, :model
  #
  # or
  #
  # permit_params do
  #   permitted = [:permitted, :attributes]
  #   permitted << :other if resource.something?
  #   permitted
  # end


end
