class CreateListsTable < ActiveRecord::Migration
    def change
        create_table :lists do |t|
            t.string :name, null: false
            t.integer :user_id, null: false
            t.string :settings, default: ""


            t.timestamps

        end
    end
end

