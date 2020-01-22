require 'net/http'

Park.destroy_all
Tag.destroy_all
TagAssignment.destroy_all

url = "https://developer.nps.gov/api/v1/parks?&api_key=lXfjAlHlFE71rZUicaPfOEqWGDAF6NBT7Q3OpqjC&limit=50"
uri = URI(url)
response = Net::HTTP.get(uri)
response_hash = JSON.parse(response)

parks_info = response_hash["data"]

parks_info.each do |park|
    if park["designation"]["National Park"]
      Park.create(
          name: park["fullName"], 
          state: park["states"],
          description: park["description"],
          weather: park["weatherInfo"],
          url: park["url"])
    end
end
    
tag_names = ["mountainous", "valley", "fun", "adventurous", "easy hikes", "difficult hikes", "family friendly", "wildlife", "waterfalls", "desert", "forest", "river"]

tag_names.each do |tag_name| 
    Tag.create(name: tag_name)
end

TagAssignment.create({park_id: Park.ids.sample, tag_id: Tag.ids.sample})

20.times do
    TagAssignment.create(tag_id: Tag.ids.sample, park_id: Park.ids.sample)
end

#update tag
def can_update_using_update_method
    tag = Tag.find_by(name: Tag.name)
    tag.update_attribute(:name, name)
end


# parks
# yosemite = Park.new(name: "Yosemite National Park", states: "CA", description: "Not just a great valley, but a shrine to human foresight, the strength of granite, the power of glaciers, the persistence of life, and the tranquility of the High Sierra. First protected in 1864, Yosemite National Park is best known for its waterfalls, but within its nearly 1,200 square miles, you can find deep valleys, grand meadows, ancient giant sequoias, a vast wilderness area, and much more.", weatherInfo: "good weather", url: "https://www.nps.gov/state/ca/index.htm")
# arches = Park.new(name: "Arches National Park", states: "UT", description: "Lots of red rock.", weatherInfo: "hot", url: "https://www.nps.gov/state/ut/index.htm")

# tags 
# mountainous = Tag.create(name: "mountainous")
# valley = Tag.create(name: "valley")
# fun = Tag.create(name: "fun")
# adventurous = Tag.new(name: "adventurous")
# easy_hikes = Tag.new(name: "easy hikes")
# difficult_hikes = Tag.new(name: "difficult hikes")
# family_friendly = Tag.new(name: "family friendly")
# wildlife = Tag.new(name: "lots of wildlife")
# waterfalls = Tag.new(name: "waterfalls")
# desert = Tag.new(name: "desert")
# forest = Tag.new(name: "forest")
# river = Tag.new(name: "river")


binding.pry
