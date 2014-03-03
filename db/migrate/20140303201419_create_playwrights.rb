class CreatePlaywrights < ActiveRecord::Migration
  def change
    create_table :playwrights do |t|
    	t.string :name
    	t.string :email
    	t.string :city
    	t.string :state
    	t.boolean :local
    	t.boolean :relationship

      t.timestamps
    end
  end
end
