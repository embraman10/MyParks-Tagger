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

binding.pry
    
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
TagAssignment.create(park: Park.find_by(name: "Arches National Park"), tag: Tag.find_by(name: "sandy"))
TagAssignment.create(park: Park.find_by(name: "Arches National Park"), tag: Tag.find_by(name: "warm in the winter"))
TagAssignment.create(park: Park.find_by(name: "Arches National Park"), tag: Tag.find_by(name: "easy hikes"))
TagAssignment.create(park: Park.find_by(name: "Black Canyon Of The Gunnison National Park"), tag: Tag.find_by(name: "mountainous"))
TagAssignment.create(park: Park.find_by(name: "Black Canyon Of The Gunnison National Park"), tag: Tag.find_by(name: "difficult hikes"))
TagAssignment.create(park: Park.find_by(name: "Crater Lake National Park"), tag: Tag.find_by(name: "mountainous"))
TagAssignment.create(park: Park.find_by(name: "Crater Lake National Park"), tag: Tag.find_by(name: "difficult hikes"))
TagAssignment.create(park: Park.find_by(name: "Glacier National Park"), tag: Tag.find_by(name: "mountainous"))
TagAssignment.create(park: Park.find_by(name: "Glacier National Park"), tag: Tag.find_by(name: "difficult hikes"))
TagAssignment.create(park: Park.find_by(name: "Glacier National Park"), tag: Tag.find_by(name: "waterfalls"))
TagAssignment.create(park: Park.find_by(name: "Glacier National Park"), tag: Tag.find_by(name: "lots of wildlife"))
TagAssignment.create(park: Park.find_by(name: "Indiana Dunes National Park"), tag: Tag.find_by(name: "sandy"))
TagAssignment.create(park: Park.find_by(name: "Indiana Dunes National Park"), tag: Tag.find_by(name: "easy hikes"))
TagAssignment.create(park: Park.find_by(name: "Mount Rainier National Park"), tag: Tag.find_by(name: "mountainous"))
TagAssignment.create(park: Park.find_by(name: "Mount Rainier National Park"), tag: Tag.find_by(name: "rivers"))
TagAssignment.create(park: Park.find_by(name: "Rocky Mountain National Park"), tag: Tag.find_by(name: "mountainous"))
TagAssignment.create(park: Park.find_by(name: "Rocky Mountain National Park"), tag: Tag.find_by(name: "difficult hikes"))
TagAssignment.create(park: Park.find_by(name: "Rocky Mountain National Park"), tag: Tag.find_by(name: "lots of wildlife"))
TagAssignment.create(park: Park.find_by(name: "Rocky Mountain National Park"), tag: Tag.find_by(name: "rivers"))
TagAssignment.create(park: Park.find_by(name: "Sequoia & Kings Canyon National Parks"), tag: Tag.find_by(name: "mountainous"))
TagAssignment.create(park: Park.find_by(name: "Sequoia & Kings Canyon National Parks"), tag: Tag.find_by(name: "valley"))
TagAssignment.create(park: Park.find_by(name: "Sequoia & Kings Canyon National Parks"), tag: Tag.find_by(name: "difficult hikes"))
TagAssignment.create(park: Park.find_by(name: "Yellowstone National Park"), tag: Tag.find_by(name: "lots of wildlife"))
TagAssignment.create(park: Park.find_by(name: "Yellowstone National Park"), tag: Tag.find_by(name: "forest"))
TagAssignment.create(park: Park.find_by(name: "Yellowstone National Park"), tag: Tag.find_by(name: "river"))
TagAssignment.create(park: Park.find_by(name: "Yosemite National Park"), tag: Tag.find_by(name: "mountainous"))
TagAssignment.create(park: Park.find_by(name: "Yosemite National Park"), tag: Tag.find_by(name: "valley"))
TagAssignment.create(park: Park.find_by(name: "Yosemite National Park"), tag: Tag.find_by(name: "river"))
TagAssignment.create(park: Park.find_by(name: "Yosemite National Park"), tag: Tag.find_by(name: "lots of wildlife"))
TagAssignment.create(park: Park.find_by(name: "Yosemite National Park"), tag: Tag.find_by(name: "waterfalls"))

#update tag
def update_using_update_method
    tag = Tag.find_by(name: Tag.name)
    tag.update_attribute(:name, name)
end

binding.pry
