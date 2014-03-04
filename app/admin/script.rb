ActiveAdmin.register Script do
	menu priority: 2
  
	filter :title
	filter :playwright_name, :as => :string
	filter :year
	filter :males
	filter :females
	filter :other
	filter :must_read
	filter :sent_to
	filter :sent_by
	filter :requested_by
	filter :rights_holder

	config.sort_order = "title_asc"


	index do 
		selectable_column
		column :name do |script|
			link_to script.title, script_path(script)
		end
		column :author do |script|
			link_to script.playwright.name, playwright_path(script.playwright)
		end
		column :year
		column :males
		column :females
		column :other
		column :must_read
		default_actions
	end

	 show do |script|
  	attributes_table do
  		row :title
  		row :playwright do |s|
  			link_to s.playwright.name, playwright_path(s.playwright)
  		end
  		row :year
  		row :males
  		row :females
  		row :other
  		row :must_read
  		row :sent_to
  		row :sent_by
  		row :requested_by
  		row :rights_holder

  	end

  	active_admin_comments
  end
 	form do |f|
 		f.inputs "Script" do
 			f.input :title
 			f.input :playwright
 			f.input :males
 			f.input :females
 			f.input :other
 			f.input :must_read
 			f.input :sent_to
 			f.input :sent_by
 			f.input :requested_by
 			f.input :rights_holder
 		end
 		f.actions
 	end    

end
