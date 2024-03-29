ActiveAdmin.register Script do
	menu priority: 2
  
	filter :title
	filter :playwright_name, :as => :string
	filter :year
	filter :males, :as => :numeric_range
	filter :females, :as => :numeric_range
	filter :other, :as => :numeric_range
	filter :must_read
	filter :sent_to
	filter :sent_by
	filter :requested_by
	filter :rights_holder

	config.sort_order = "title_asc"

	member_action :download, :method => :get do
		script = Script.find(params[:id])
		if script.link?
			redirect_to script.link.to_s
		else
			raise ActionController::RoutingError.new('Not Found')
		end
	end

	member_action :review, :method => :get do
		@review = Review.new
		@review.script_id = params[:id]
		@review.reader = current_admin_user
		@page_title = "New Review"
		@action = save_review_script_path(params[:id])
		render "scripts/new_review"
	end

	member_action :save_review, :method => :post do
		@review = Review.new(params[:review])
		@review.reader = current_admin_user
		@review.save
		redirect_to review_path @review
	end

	action_item :only => :show do |s|
		link_to "New Review", review_script_path(:id => resource)
	end

	action_item :only => :show do |s|
    link_to('Download', download_script_path(resource)) if resource.link?
  end


	index do 
		selectable_column
		column :name, :sortable => :title do |script|
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
		actions do |s|
			link_to "Download", download_script_path(s) if s.link?
		end
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

  	panel "Script Reviews" do
  		table_for script.reviews do
  			column :reader do |r|
  				link_to r.reader.real_name, reader_path(r.reader)
  			end
  			column :title do |r|
  				r.reader.title
  			end
  			column :recommendation
  			column :actions do |r|
  				links = ''.html_safe
  			 	links << link_to("View", review_path(r))
					links << " "
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
	form(:html => { :multipart => true }) do |f|
 		f.inputs "Script" do
 			f.input :title
 			f.input :playwright, :input_html_options => { :class => 'chosen' }
 			f.input :males
 			f.input :females
 			f.input :other
 			f.input :must_read
 			f.input :sent_to
 			f.input :sent_by
 			f.input :requested_by
 			f.input :rights_holder
 			f.input :link, :as => :file, :label => "Script Attachment"
 			f.input :remove_link, :as => :boolean, :label => "Remove attached script" if f.object.link?
 			f.input :link_cache, :as => :hidden
 		end

 		f.actions
 	end    

 	controller do
 		def new
 			@script = Script.new
 			if params[:id]
 				@script.playwright_id = params[:id]
 			end
 			render "active_admin/resource/new"
 		end
 	end

end
