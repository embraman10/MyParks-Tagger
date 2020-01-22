class CreateParks < ActiveRecord::Migration[4.2]
    def change 
        create_table :parks do |t|
            t.string :name
            t.string :state
            t.text :description
            t.string :weather
            t.string :url
        end
    end
end