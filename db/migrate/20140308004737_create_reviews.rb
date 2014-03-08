class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
    	t.integer :script_id
    	t.string :link 
    	t.integer :reader_id
    	t.string :recommendation

      t.timestamps
    end
  end
end
