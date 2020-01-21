require 'net/http'

url = "https://developer.nps.gov/api/v1/parks?&api_key=lXfjAlHlFE71rZUicaPfOEqWGDAF6NBT7Q3OpqjC&limit=400"

uri = URI(url)

response = Net::HTTP.get(uri)

response_hash = JSON.parse(response)

#binding.pry

# response_hash.each do |park|
#     if park["designation", "National Park"]
#       Park.new
#   end
# end

# parks
yosemite = Park.new(name: "Yosemite National Park", states: "CA", description: "Not just a great valley, but a shrine to human foresight, the strength of granite, the power of glaciers, the persistence of life, and the tranquility of the High Sierra. First protected in 1864, Yosemite National Park is best known for its waterfalls, but within its nearly 1,200 square miles, you can find deep valleys, grand meadows, ancient giant sequoias, a vast wilderness area, and much more.", weatherInfo: "good weather", url: "https://www.nps.gov/state/ca/index.htm")
arches = Park.new(name: "Arches National Park", states: "UT", description: "Lots of red rock.", weatherInfo: "hot", url: "https://www.nps.gov/state/ut/index.htm")

# tags 
mountainous = Tag.create(name: "mountainous")
valley = Tag.create(name: "valley")
fun = Tag.create(name: "fun")
adventurous = Tag.new(name: "adventurous")

