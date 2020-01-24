class Tag < ActiveRecord::Base
    has_many :tag_assignments
    has_many :parks, through: :tag_assignments

    def self.names
        ordered = self.order(:name)
        ordered.map(&:name)
    end

    def self.delete_tag(user_selection)
        tag_to_destroy = Tag.find_by(name: user_selection)
        tag_to_destroy.destroy
    end

end