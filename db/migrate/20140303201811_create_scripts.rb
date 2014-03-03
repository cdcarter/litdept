class CreateScripts < ActiveRecord::Migration
  def change
    create_table :scripts do |t|
    	t.string :title
    	t.string :year
    	t.integer :playwright_id
    	t.integer :males
    	t.integer :females
    	t.integer :other
    	t.string :link
    	t.string :sent_to

      t.timestamps
    end
  end
end
