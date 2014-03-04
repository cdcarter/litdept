class AddUsefulnessToUsers < ActiveRecord::Migration
  def change
  	change_table "admin_users" do |t|
  		t.string :real_name
  		t.string :title
  		t.boolean :inactive
  	end
  end
end
