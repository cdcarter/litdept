ActiveAdmin.register Review do
	menu priority:  3
  
  index do 
		selectable_column

		column :title do |review|
			link_to review.script.title, script_path(review.script)
		end

		column :reader do |review|
			link_to review.reader.real_name, reader_path(review.reader)
		end

		column :recommendation
		column :link

		column :created_at

		default_actions
	end
end
