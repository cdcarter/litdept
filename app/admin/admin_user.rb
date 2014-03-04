ActiveAdmin.register AdminUser, :as => "Reader" do     
  index do               
    column :real_name
    column :title             
    column :email                     
    column :current_sign_in_at        
    column :last_sign_in_at           
    column :sign_in_count             
    default_actions                   
  end                                 

  filter :email                       

  form do |f|                         
    f.inputs "Admin Details" do       
      f.input :email                  
      f.input :password               
      f.input :password_confirmation  
      f.input :real_name
      f.input :title
    end                               
    f.actions                         
  end                                 
end                                   
