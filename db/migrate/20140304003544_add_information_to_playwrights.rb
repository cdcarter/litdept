class AddInformationToPlaywrights < ActiveRecord::Migration
  def change
  	change_table :playwrights do |t|
  		t.string :representation
  		t.text :agent_contact
  		t.text :contact
  	end

  	change_table :scripts do |t|
  		t.string :requested_by
  		t.string :sent_by
  		t.string :rights_holder
  		t.boolean :must_read
  	end
  end
end
