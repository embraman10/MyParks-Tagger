class CreateTagAssignments < ActiveRecord::Migration[4.2]
    def change
        create_table :tag_assignments do |t|
            t.integer :park_id
            t.integer :tag_id
        end
    end
end