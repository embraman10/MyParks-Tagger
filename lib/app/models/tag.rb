class Tag < ActiveRecord::Base
    has_many :tag_assignments
    has_many :parks, through: :tag_assignments
end