# Hash of city names and area codes represented in key value
dial_book = {
"newyork" => "212",
"newbrunswick" => "732",
"edison" => "908",
"plainsboro" => "609",
"sanfrancisco" => "301"
}

# Method to print key for 'dial_book' hash
def get_city_names(somehash)
  somehash.each { |k, v| puts k }
end

def get_area_code(somehash, key)
  somehash[key]
end

# Ask user if thye would like to lookup area code
loop do
  puts "Do you want to lookup an area code based on a city name?(Y/N)"
  answer = gets.chomp
  if answer != "Y"
    break
end

# Ask what city they want to look up
# Call 'get_city_names' method
puts "Which city do you want the area code for?"
  get_city_names(dial_book)

# prompt user for selection.
# use include method on hash using 'prompt'
# if value is in hash return in 'puts'
puts "Enter your selection"
  prompt = gets.chomp
  if dial_book.include?(prompt)
    puts "The area code for #{prompt} is #{get_area_code(dial_book, prompt)}"
  else
    puts "You entered a city name not in the dictionary"
  end
end
