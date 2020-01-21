class CreateTagAssignments < ActiveRecord::Migration[4.2]
    def change
        create_table :tag_assignments do |t|
            t.integer :parks_id
            t.integer :tags_id
        end
    end
end