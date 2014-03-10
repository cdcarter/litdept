ActiveAdmin.register Playwright do
	menu :priority => 1

	filter :name
	filter :representation
	filter :scripts_title, :as => :string
	filter :local
	filter :relationship

	config.sort_order = "name_asc"

	index do      
		selectable_column         
    column :name do |playwright|
      link_to playwright.name, playwright_path(playwright)
    end
    column :email                     
    column :local
    column :city do |p| 
    	"#{p.city}, #{p.state}" 
   	end
    column :relationship           
    column :representation             
    default_actions                   
  end        

  show do |pw|
  	attributes_table do
  		row :name
  		row :email
  		row :representation
  		row :city
  		row :state
  		row :local
  		row :relationship
  		row :contact
  		row :agent_contact
  	end

  	panel "Scripts" do
  		table_for(pw.scripts) do
  			column :title do |script|
  				link_to script.title, script_path(script)
  			end
  			column :year
  			column :males
  			column :females
  			column :other
  			column :script do |s|
          link_to "Download", download_script_path(s) if s.link?
        end
  		end
  		
  		b(link_to("New Script", new_script_path(:id => pw.id)))
  	end


  	active_admin_comments
 	end  

 	form do |f|
 		f.inputs "Playwright" do
 			f.input :name
 			f.input :email
 			f.input :representation
 			f.input :city
 			f.input :state
 			f.input :local
 			f.input :relationship
 			f.input :contact, :input_html => { :rows => 4 } 
 			f.input :agent_contact, :input_html => { :rows => 4 } 
 		end
 		f.actions
 	end    
end
