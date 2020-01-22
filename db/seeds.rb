require 'net/http'

Park.destroy_all

url = "https://developer.nps.gov/api/v1/parks?&api_key=lXfjAlHlFE71rZUicaPfOEqWGDAF6NBT7Q3OpqjC&limit=50"
uri = URI(url)
response = Net::HTTP.get(uri)
response_hash = JSON.parse(response)

parks_info = response_hash["data"]


# parks_info.each do |park_info|
#     Park.create(name: park_info["data"]["fullName"], state: park_info["data"]["states"],
#     description: park_info["data"]["description"], weather: park_info["data"]["weatherInfo"], url: park_info["data"]["url"])
#   end
# end

parks_info.each do |park|
    if park["designation"]["National Park"]
      Park.create(
          name: park["fullName"], 
          states: park["states"],
          description: park["description"],
          weatherInfo: park["weatherInfo"],
          url: park["url"])
    end
end
    
# binding.pry

# parks
yosemite = Park.new(name: "Yosemite National Park", states: "CA", description: "Not just a great valley, but a shrine to human foresight, the strength of granite, the power of glaciers, the persistence of life, and the tranquility of the High Sierra. First protected in 1864, Yosemite National Park is best known for its waterfalls, but within its nearly 1,200 square miles, you can find deep valleys, grand meadows, ancient giant sequoias, a vast wilderness area, and much more.", weatherInfo: "good weather", url: "https://www.nps.gov/state/ca/index.htm")
arches = Park.new(name: "Arches National Park", states: "UT", description: "Lots of red rock.", weatherInfo: "hot", url: "https://www.nps.gov/state/ut/index.htm")

# tags 
mountainous = Tag.create(name: "mountainous")
valley = Tag.create(name: "valley")
fun = Tag.create(name: "fun")
adventurous = Tag.new(name: "adventurous")
easy_hikes = Tag.new(name: "easy hikes")
difficult_hikes = Tag.new(name: "difficult hikes")
family_friend = Tag.new(name: "family friendly")
wildlife = Tag.new(name: "lots of wildlife")
waterfalls = Tag.new(name: "waterfalls")
desert = Tag.new(name: "desert")
forest = Tag.new(name: "forest")
river = Tag.new(name: "river")

Park.names_by_alpha

binding.pry
