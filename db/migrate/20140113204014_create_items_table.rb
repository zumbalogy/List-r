class CreateItemsTable < ActiveRecord::Migration
    def change
        create_table :items do |t|

            t.integer :list_id, null: false
            t.string :title, null: false

            t.string :director
            t.integer :year
            t.string :language
            t.string :genre

            t.boolean :series, default: false

            t.string :recommended_by

            t.boolean :priority, default: false
            t.boolean :seen, default: false
            t.boolean :like, default: false
            t.integer :rating

            t.string :notes
            t.string :notes2

            t.string :where
            t.string :link

            t.string :settings, default: ""

            t.timestamps
        end
    end
end
