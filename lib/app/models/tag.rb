class Tag < ActiveRecord::Base
    has_many :tag_assignments
    has_many :parks, through: :tag_assignments

    # return_tag_names = Tag.all.map {|tag| tag.name}

    def self.names
        ordered = self.order(:name)
        ordered.map(&:name)
    end

    def self.find_or_create_by(user_selection)
        Tag.find_by(name: user_selection) ||  Tag.create(name: user_selection)
    end

    def self.delete_tag(user_selection)
        Tag.find_by(name: user_selection)
        Tag.user_selection.destroy
    end

end