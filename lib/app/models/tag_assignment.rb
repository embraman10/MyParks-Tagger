class TagAssignment < ActiveRecord::Base
    belongs_to :park
    belongs_to :tag

    def self.find_park_by_tag(tag_name)
        tag_id = Tag.find {|tag| tag.name == tag_name}.id

        tag_instances = TagAssignment.all.select do |tag_assignment|
            tag_assignment.tag_id == tag_id
        end

        tag_instances.map do |ti|
            Park.find(ti.park_id).name
        end
    end


    #validates :name, uniqueness: true
end