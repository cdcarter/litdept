class InactiveBeActive < ActiveRecord::Migration
  def up
  	rename_column :admin_users, :inactive, :active
  	a = AdminUser.find(1)
  	a.active = true
  	a.save!
  end

  def down
  	rename_column :admin_users, :active, :inactive
  end
end
