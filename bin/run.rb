require_relative '../config/environment'
require 'pry'
ActiveRecord::Base.logger = nil

def clear_screen
  puts "\e[H\e[2J"
end

clear_screen
puts "Welcome to MyParks Tagger!"

if user_choice == "1"
    display_alphabetical_parks
elsif user_choice == "2"
    handle_tag_search
else
    puts "Thank you for using!"
end

user_options = gets.chomp



def handle_tag_search
    clear_screen

    puts "Please select from the following options:"

    Tag.all.each do |tag, index|
        puts "#{index + 1}, #{tag.name.capitalize} "
    end

    case user_option
    when "1"
        tag_name = "mountainous"
    when "2"
        tag_name = 
    when "3"
        tag_name = 
    end

    display_tag = Tag.find_by(name: tag_name)

    parks_to_show = display_tag.parks.uniq

    parks_to_show.each do |park|
        puts park.list_display
    end
end

binding.pry
