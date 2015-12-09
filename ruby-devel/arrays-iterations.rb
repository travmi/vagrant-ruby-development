a = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

arrayname.empty?
arrayname.include?(itemname) # does item exist?
arrayname.reverse
arrayname.reverse! # use ! at the end to change the original array
arrayname.shuffle
arrayname.push(30) # will append new element 30 to the end array
arrayname << 25 # << known as shovel operator will also append new element to the end of the array
arrayname.unshift("someelement") # will add element "some element" to the beginning of the array
arrayname.pop # will remove the last element of the array and return 1
arrayname.uniq # will remove all the duplicates and display (will not change the original array)
arrayname.uniq! # will remove all the duplicates in the original array

(0..25).to_a

(0..99).to_a.shuffle!

y = (0..99.to_a.shuffle) # create an array of 100 numbers and shuffle them
y.each { |i| puts i } # itterate through array 'y' and print each number on a line

for number in y # For each occurrence in array
  puts "Hi" # print Hi
end

names = ["joe", "john", "james"]
names.each do |randomvariablename| # starts the do block
  puts "Hello #{randomvariablename}" # executes code for each element
end # ends the do block

names = ["joe", "john", "james"]
names.each do |randomname| # starts the do block
  puts "Hello #{randomname.capitalize}" # executes code for each element
end # ends the do block

# Preferred Ruby 
names.each { |randomvariablename| puts "Hello #{randomvariablename.capitalize}" }

y.select { |number| number.odd? } # selects the value and returns it only if the condition is met

# To join the elements of an array named p:
p.join

# To join the elements of an array with space in between each element:
p.join(" ")

# To join the elements of an array with dash in between each element:
p.join("-")
