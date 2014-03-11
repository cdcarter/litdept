ActiveAdmin.register AdminUser, :as => "Reader" do     
  menu priority: 4

  index do               
    column :real_name
    column :title             
    column :email                     
    column :current_sign_in_at        
    column :last_sign_in_at           
    column :sign_in_count             
    default_actions                   
  end          

  show do |u|
    attributes_table do
      row :real_name
      row :title
      row :email
    end

    panel "Reviews" do
      table_for(u.reviews) do
        column :title do |r|
          link_to r.script.title, script_path(r.script)
        end
        column :recommendation
        column :actions do |r|
          links = ''.html_safe
          links << link_to("Edit", edit_review_path(r))
          links << " "
          links << link_to("Delete", review_path(r),
              method: :delete, data: {confirm: I18n.t('active_admin.delete_confirmation')})
          links << " "
          links << link_to("Download", download_review_path(r)) if r.link?
          links
        end
      end
    end

    active_admin_comments
  end                       

  filter :email                       

  form do |f|                         
    f.inputs "Admin Details" do       
      f.input :email                  
      f.input :password               
      f.input :password_confirmation  
      f.input :real_name
      f.input :title
      f.input :active, :as => :boolean
    end                               
    f.actions                         
  end                                 
end                                   
