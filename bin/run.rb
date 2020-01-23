require_relative '../config/environment'
require 'pry'
ActiveRecord::Base.logger = nil
PROMPT = TTY::Prompt.new

#OPENING_MENU = back_to_opening
user_input =  ""
######## PROMPTS #########################

def user_prompt_one
    user_selection_parks = PROMPT.select("Explore the parks:", Park.names_by_alpha)
    puts Park.find_by(name: user_selection_parks).list_display
    puts "Press enter to return to the main menu"
    gets.chomp
    "main"
end

def user_prompt_two
    user_selection_tags = PROMPT.select("View the tags:",Tag.names)
    park_names = TagAssignment.find_park_by_tag(user_selection_tags) 
    puts park_names 
    puts "\n"
    puts "Press enter to return to the main menu"
    gets.chomp
    "main"
end

def user_prompt_three
    user_find_or_create_tags = PROMPT.ask("View and/or create tags", default: ENV["User"])
    find_create_tags = Tag.find_or_create_by(name: user_find_or_create_tags)
    puts "#{user_find_or_create_tags} has been successfully added!"
    puts "\n"
    puts "Press enter to return to the main menu"
    gets.chomp
    "main"
end

def user_prompt_four
    user_delete_tag = PROMPT.select("Choose the tag you'd like to delete", Tag.names)
    delete_tags = Tag.delete_tag(user_delete_tag)
    puts "#{user_delete_tag} has been successfully removed!"
    puts "\n"
    puts "Press enter to return to the main menu"
    gets.chomp
    "main"
end

def main_menu
    PROMPT.select("Please select from the options below:", ["1. Explore the parks", "2. View tags", "3. Find or create tags", "4. Delete tags", "5. Exit"])
end

######################################
user_input = ""
puts `clear`
########## METHOD AREA ##########
user_input = "main"
#################################

def greeting
    puts "Welcome to MyParks Tagger!"
    puts "\n"
end
greeting
puts "Press enter to get started!"

gets.chomp 
puts "Loading park data..."
sleep(2)

while user_input != "5. Exit"
    case user_input
    when "main"
        puts `clear`
        user_input = main_menu
    when "1. Explore the parks"
        puts `clear`
        user_input = user_prompt_one
    when "2. View tags"
        puts `clear`
        user_input = user_prompt_two
    when "3. Find or create tags"
        puts `clear`
        user_input = user_prompt_three
    when "4. Delete tags"
        puts `clear`
        user_input = user_prompt_four
    end
end

 # puts `clear`
# puts "Thanks for using this useless app!!!!\nGoodbye, #{user_name}!"

# def clear_screen
#     puts `clear`
# end

# clear_screen

# ### METHODS ###

# def greeting
#     puts "Welcome to MyParks Tagger!"
#     puts "\n"
# end
# greeting

# user_menu_option = PROMPT.select("Please select from the options below:", ["1. Explore the parks", "2. View tags and their associated parks", "3. Find or create tags", "4. Delete tags", "5. Exit"])

# if user_menu_option == "1. Explore the parks"
#     user_selection_one = PROMPT.select("Explore the parks:", Park.names_by_alpha)
#     puts Park.find_by(name: user_selection_one).list_display
# elsif user_menu_option == "2. View tags and their associated parks"
#     user_selection_two = PROMPT.select("View the tags:", Tag.names)
#     park_names = TagAssignment.find_park_by_tag(user_selection_two) 
#     puts park_names
# elsif user_menu_option == "3. Find or create tags"
#     user_selection_three = PROMPT.ask("View and/or create tags", default: ENV["User"])
#     find_create_tags = Tag.find_or_create_by(name: user_selection_three)
# elsif user_menu_option == "4. Delete tags"
#     user_selection_four = PROMPT.select("Choose the tag you'd like to delete", Tag.names)
#     delete_tags = Tag.delete_tag(user_selection_four)
#     puts "#{user_selection_four} has been successfully removed!\nPress enter to continue"
#     get.chomp 
#     "main"
# end

#Tag.find_or_create
#TagAssignment.find_or_create(park: Park.find_by user_selection(user_selection))

# while USER_INPUT != "Exit"
#     case USER_INPUT
#     when ""
#         puts `clear`
#         USER_INPUT = user_menu_option
#     when "1. Explore the parks"
#         puts `clear`
#         USER_INPUT = user_selection_one
#     when "2. View tags"
#         puts `clear`
#         USER_INPUT = user_selection_two
#     when "3. Find or create tags"
#         puts `clear`
#         USER_INPUT = user_selection_three
#     when "4. Delete tags"
#         puts `clear`
#         USER_INPUT = user_selection_four
#     end
# end

# puts `clear`

# puts "Thank you for using MyParks Tagger!"


# user_selection_one = PROMPT.select("Explore the parks:", Park.names_by_alpha)
# puts Park.find_by(name: user_selection_one).list_display

# user_selection_two = PROMPT.select("View the tags:", Tag.names)
# puts Tag.find_by(name: user_selection_two)

# user_selection_three = PROMPT.select("View and/or create tags:", Tag.names)
# puts Tag.find_or_create_by(name: user_selection_three)

# user_selection_four = PROMPT.select()

#binding.pry

### case methods ###

# case user_menu_option
# when "1. Explore the parks"
#     puts `clear`
#     puts user_selection_one
# when "2. View tags"
#     puts `clear`
#     puts user_selection_two
# when "3. Find or create tags"
#     puts `clear`
#     puts user_selection_three
# when "5. Exit"
#     puts `clear`
#     puts user_selection_four
# end

# while USER_INPUT != "Exit"
#     case USER_INPUT
#     when ""
#         puts `clear`
#         USER_INPUT = opening_menu
#     when "1. Explore the parks"
#         puts `clear`
#         USER_INPUT = user_selection_one
#     when "2. View tags"
#         puts `clear`
#         USER_INPUT = user_selection_two
#     when "3. Find or create tags"
#         puts `clear`
#         USER_INPUT = user_selection_three
#     when "4. Delete tags"
#         puts `clear`
#         USER_INPUT = user_selection_four
#     end
# end

# puts `clear`

# puts "Thank you for using MyParks Tagger!"

# def display_alpha_names
#     puts "Below are all the national parks you can explore:"
#     Park.names_by_alpha
# end
# display_alpha_names

# def display_tag_names
#     puts "Below are the tags you can explore:"
#     puts Tag.names
# end
# display_tag_names
#choice 3 find a tag
#########################

# user_choice = gets.chomp
# def find_or_create (user_choice)
# #if search is in tags array 

# end

# def tag_to_park
#     display_tag = Tag.find_by(name: tag)

#     parks_to_show = display_tag.parks #(.uniq)
# end

# clear_screen

# puts "Parks found! Here is your list:"

# parks_to_show.each do |park|
#   puts park.list_display
# end


#################################
# clear_screen

# if opening_menu ==  "1. Explore the parks"
#     user_selection_parks
# elsif opening_menu == "2. View tags"
#     display_tag_names
# elsif opening_menu == "3. Find or create tags"
#     []
# else opening_menu == "4. Delete tags"
#     []
# end

# clear_screen


# PROMPT.select("1. Explore the parks",)
# PROMPT.select("2. View all tags",)
# PROMPT.select("3. Find or create tag", [])


# user_park = gets.chomp

# user_park.park_find_by_name

# puts "Please select from the following options:"

# puts "1. View all parks\n2. View all tags"

# user_choice = gets.chomp 

# if user_choice == "1"
#     display_alpha_names
# elsif user_choice == "2"
#     display_tag_names
# elsif user_choice == "3"
#     # find park by name
# elsif user_choice == "4"
#     # find_or_create tag by name
# end



# if user_choice == "1"
#     display_alphabetical_parks
# elsif user_choice == "2"
#     handle_tag_search
# else
#     puts "Thank you for using!"
# end

# user_options = gets.chomp



# def handle_tag_search
#     clear_screen

#     puts "Please select from the following options:"

#     Tag.all.each do |tag, index|
#         puts "#{index + 1}, #{tag.name.capitalize} "
#     end

#     user_option = gets.chomp

#     case user_option
#     when "1"
#         tag_name = "adventurous"
#     when "2"
#         tag_name = "desert"
#     when "3"
#         tag_name = "difficult hikes"
#     when "4"
#         tag_name = "easy hikes"
#     when "5"
#         tag_name = "family friendly"
#     when "6"
#         tag_name = "forest"
#     when "7"
#         tag_name = "fun"
#     when "8"
#         tag_name = "mountainous"
#     when "9"
#         tag_name = "river"
#     when "10"
#         tag_name = "sandy"
#     when "11"
#         tag_name = "valley"
#     when "12"
#         tag_name = "warm in the winter"
#     when "13"
#         tag_name = "waterfalls"
#     when "14"
#         tag_name = "wildlife"
#     end

#     def tag_to_park
#         display_tag = Tag.find_by(name: tag_name)
    
#         parks_to_show = display_tag.parks #(.uniq)
#     end
    
#     clear_screen
    
#     puts "Parks found! Here is your list:"
    
#     parks_to_show.each do |park|
#       puts park.list_display
#     end
# end


# def handle_tag_search
#     clear_screen
  
#     puts "Please select from the following options:"
  
#     Tag.all.each_with_index do |tag, index|
#       puts "#{index + 1}. #{tag.name.capitalize}"
#     end
  
#     user_option = gets.chomp
  
#     case user_option
#     when "1"
#       tag_name = "funny"
#     when "2"
#       tag_name = "scary"
#     when "3"
#       tag_name = "smart"
#     end
  
#     display_tag = Tag.find_by(name: tag_name)
  
#     books_to_show = display_tag.books.uniq
  
#     clear_screen
  
#     puts "Books found! Here is your list:"
  
#     books_to_show.each do |book|
#       puts book.list_display
#     end
#   end