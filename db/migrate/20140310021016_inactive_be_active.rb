class InactiveBeActive < ActiveRecord::Migration
  def up
  	rename_column :admin_users, :inactive, :active
  end

  def down
  	rename_column :admin_users, :active, :inactive
  end
end
