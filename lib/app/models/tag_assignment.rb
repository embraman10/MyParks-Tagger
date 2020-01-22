class TagAssignment < ActiveRecord::Base
    belongs_to :park
    belongs_to :tag

    #validates :name, uniqueness: true
end