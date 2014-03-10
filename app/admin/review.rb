ActiveAdmin.register Review do
	menu priority:  3
	
	config.comments = false
  
	member_action :download, :method => :get do
		review = Review.find(params[:id])
		if review.link?
			redirect_to review.link.to_s
		else
			raise ActionController::RoutingError.new('Not Found')
		end
	end

	action_item :only => :show do |s|
    link_to('Download', download_review_path(resource)) if resource.link?
  end

	controller do
  	def create
    	params[:review][:reader_id] = current_admin_user.id
    	create!
  	end 
	end 

  index do 
		selectable_column

		column :title do |review|
			link_to review.script.title, script_path(review.script)
		end

		column :reader do |review|
			link_to review.reader.real_name, reader_path(review.reader)
		end

		column :recommendation

		column :created_at

		actions :defaults => false do |r|
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

	form(:html => { :multipart => true }) do |f|
 		f.inputs "Script" do
 			f.input :script
 			f.input :recommendation
 		 	f.input :link, :as => :file 
 			f.input :remove_link, :as => :boolean, :label => "Remove attachment" if f.object.link?
 			f.input :link_cache, :as => :hidden
 		end

 		f.actions
 	end
end
