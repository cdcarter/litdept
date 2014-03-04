ActiveAdmin.register Playwright do
	menu :priority => 1

	filter :name
	filter :representation
	filter :scripts_title, :as => :string
	filter :local
	filter :relationship

	index do               
    column :name do |playwright|
      link_to playwright.name, admin_playwright_path(playwright)
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
end
