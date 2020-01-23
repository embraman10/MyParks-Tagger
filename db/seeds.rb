require 'net/http'

Park.destroy_all
Tag.destroy_all
TagAssignment.destroy_all

url = "https://developer.nps.gov/api/v1/parks?&api_key=lXfjAlHlFE71rZUicaPfOEqWGDAF6NBT7Q3OpqjC&limit=200"
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
    
tag_names = ["mountainous", "valley", "fun", "adventurous", "easy hikes", "difficult hikes", "family friendly", "wildlife", "waterfalls", "desert", "forest", "river", "sandy", "warm in the winter"]

# tag_names.each do |tag_name| 
#     Tag.create(name: tag_name)
# end


# tags 
mountainous = Tag.create(name: "mountainous")
valley = Tag.create(name: "valley")
fun = Tag.create(name: "fun")
adventurous = Tag.create(name: "adventurous")
easy_hikes = Tag.create(name: "easy hikes")
difficult_hikes = Tag.create(name: "difficult hikes")
family_friendly = Tag.create(name: "family friendly")
wildlife = Tag.create(name: "lots of wildlife")
waterfalls = Tag.create(name: "waterfalls")
desert = Tag.create(name: "desert")
forest = Tag.create(name: "forest")
river = Tag.create(name: "river")
sandy = Tag.create(name: "sandy")
warm_in_the_winter = Tag.create(name: "warm in the winter")

#associations
TagAssignment.create(park: Park.find_by(name: "Bryce Canyon National Park"), tag: Tag.find_by(name: "sandy"))
TagAssignment.create(park: Park.find_by(name: "Bryce Canyon National Park"), tag: Tag.find_by(name: "warm in the winter"))
TagAssignment.create(park: Park.find_by(name: "Cuyahoga Valley National Park"), tag: Tag.find_by(name: "river"))
TagAssignment.create(park: Park.find_by(name: "Cuyahoga Valley National Park"), tag: Tag.find_by(name: "waterfalls"))
TagAssignment.create(park: Park.find_by(name: ""), tag: Tag.find_by(name: ""))
TagAssignment.create(park: Park.find_by(name: ""), tag: Tag.find_by(name: ""))
TagAssignment.create(park: Park.find_by(name: ""), tag: Tag.find_by(name: ""))
TagAssignment.create(park: Park.find_by(name: ""), tag: Tag.find_by(name: ""))
TagAssignment.create(park: Park.find_by(name: ""), tag: Tag.find_by(name: ""))
TagAssignment.create(park: Park.find_by(name: ""), tag: Tag.find_by(name: ""))
TagAssignment.create(park: Park.find_by(name: ""), tag: Tag.find_by(name: ""))
# ["Arches National Park",
#  "Badlands National Park",
#  "Big Bend National Park",
#  "Black Canyon Of The Gunnison National Park",
#  "Bryce Canyon National Park",
#  "Canyonlands National Park",
#  "Carlsbad Caverns National Park",
#  "Crater Lake National Park",
#  "Cuyahoga Valley National Park",
#  "Dry Tortugas National Park",
#  "Everglades National Park",
#  "Gates Of The Arctic National Park & Preserve",
#  "Gateway Arch National Park",
#  "Glacier Bay National Park & Preserve",
#  "Glacier National Park",
#  "Great Basin National Park",
#  "Great Sand Dunes National Park & Preserve",
#  "Guadalupe Mountains National Park",
#  "Hot Springs National Park",
#  "Indiana Dunes National Park",
#  "Kenai Fjords National Park",
#  "Lassen Volcanic National Park",
#  "Mount Rainier National Park",
#  "Petrified Forest National Park",
#  "Rocky Mountain National Park",
#  "Sequoia & Kings Canyon National Parks",
#  "Theodore Roosevelt National Park",
#  "Virgin Islands National Park",
#  "White Sands National Park",
#  "Wrangell - St Elias National Park & Preserve",
#  "Yellowstone National Park",
#  "Yosemite National Park"]
#TagAssignment.create({park_id: Park.ids.sample, tag_id: Tag.ids.sample})

# 20.times do
#     TagAssignment.create(tag_id: Tag.ids.sample, park_id: Park.ids.sample)
# end

#update tag
def update_using_update_method
    tag = Tag.find_by(name: Tag.name)
    tag.update_attribute(:name, name)
end

# parks
# yosemite = Park.new(name: "Yosemite National Park", states: "CA", description: "Not just a great valley, but a shrine to human foresight, the strength of granite, the power of glaciers, the persistence of life, and the tranquility of the High Sierra. First protected in 1864, Yosemite National Park is best known for its waterfalls, but within its nearly 1,200 square miles, you can find deep valleys, grand meadows, ancient giant sequoias, a vast wilderness area, and much more.", weatherInfo: "good weather", url: "https://www.nps.gov/state/ca/index.htm")
# arches = Park.new(name: "Arches National Park", states: "UT", description: "Lots of red rock.", weatherInfo: "hot", url: "https://www.nps.gov/state/ut/index.htm")

binding.pry
