class CreateParks < ActiveRecord::Migration[4.2]
    def change 
        create_table :parks do |t|
            t.string :name
            t.string :states
            t.text :description
            t.string :weatherInfo
            t.string :url
        end
    end
end