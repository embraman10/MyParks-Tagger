class Park < ActiveRecord::Base
    has_many :tag_assignments
    has_many :tags, through: :tag_assignments

    def list_display
        <<~PARK_DETAILS
        --~~^^^~~--~~^^^~~--~~^^^~~--~~^^^~~--~~^^^~~--~~^^^~~--~~^^^~~--~~^^^~~--~~^^^~~--~~^^^~~--~~^^^~~--~~^^^~~
            Name: #{self.name}\n
            State: #{self.state}\n
            Description: #{self.description}\n
            Weather: #{self.weather}\n
            Visit website: #{self.url}\n
        --~~^^^~~--~~^^^~~--~~^^^~~--~~^^^~~--~~^^^~~--~~^^^~~--~~^^^~~--~~^^^~~--~~^^^~~--~~^^^~~--~~^^^~~--~~^^^~~
        PARK_DETAILS
    end

    def self.names_by_alpha
        ordered = self.order(:name)
        ordered.map(&:name)
    end

    def self.find_by_name
        ordered = self.find_by(:name)
        ordered.map(&:name)
    end

end