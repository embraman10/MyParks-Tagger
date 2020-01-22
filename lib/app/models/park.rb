class Park < ActiveRecord::Base
    has_many :tag_assignments
    has_many :tags, through: :tag_assignments

    def list_display
        <<~PARK_DEETS
        -----------------------------------
            Name: #{self.name}
            State: #{self.states}
            Description: #{self.description[0..120]}
            Weather: #{self.weatherInfo}
            Visit website: #{self.url}
        ------------------------------------
        PARK_DEETS
    end

    def self.names_by_alpha
        ordered = self.order(:name)
        ordered.map(&:name)
    end

end