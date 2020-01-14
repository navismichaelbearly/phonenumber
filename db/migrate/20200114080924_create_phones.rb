class CreatePhones < ActiveRecord::Migration[5.2]
  def change
    create_table :phones do |t|
    	t.column "user_id", :integer, :limit => 10
    	t.column "phonenumber", :integer, :limit => 10
    	t.timestamps
    end
  end
end
