## QUESTION 1

 # The following is printed out:
 #1
 #2
 #2
 #3

# The uniq method does not modify the caller, therefore numbers array remains the same.
#If we had called uniq! instead, the numbers array would have been mutated.

 ## QUESTION 2

# In method naming, there is a convention that if a method name ends with '?' (for example include?) the method returns true or false, and if it ends with '!' (for example uniq!), the method mutates the caller.
# 1. != means "not equal" and is used in conditionals. For example if a != 0, to say "if a is not equal to zero".
# 2. ! before something, like !user_name returns the opposite boolean of the variable. For example !true will return false, and !nil will return true.
# 3. !! before something returns the opposite of !before something. In other words, it returns the boolean value of the variable. !!true will return true, and !!nil will return false.
# 4. ? before a single character returns it's string equivalent. For example ?T returns "T".
# 5. ? Is used to check the first case in the short-form of the if conditional.
# 6. In other cases where we put the ? character before or after something, we get an error.

 ## QUESTION 3

advice = "Few things in life are as important as house training your pet dinosaur."
advice.gsub!("important", "urgent")

## QUESTION 4

# 1. delete_at() deletes the value at the given index
# 2. delete() deletes all the array entries with the value specified.

## QUESTION 5

(1..100).include?(42)

## QUESTION 6

famous_words = "seven years ago..."

famous_words.prepend("Four score and ") # first way

"Four score and #{famous_words}" # second way

## QUESTION 7

# The result is 42.

## QUESTION 8

flintstones = ["Fred", "Wilma"]
flintstones << ["Barney", "Betty"]
flintstones << ["BamBam", "Pebbles"]

flintstones.flatten!

## QUESTION 9

flintstones = { "Fred" => 0, "Wilma" => 1, "Barney" => 2, "Betty" => 3, "BamBam" => 4, "Pebbles" => 5 }
flintstones.keep_if { |key,_| key == "Barney" }
flintstones = flintstones.flatten

puts flintstones.inspect

# OR

flintstones = { "Fred" => 0, "Wilma" => 1, "Barney" => 2, "Betty" => 3, "BamBam" => 4, "Pebbles" => 5 }
flintstones.assoc("Barney")


## QUESTION 10

flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]
flintstones_hash = {}

flintstones.each do |character|
  flintstones_hash[character] = flintstones.index(character)
end
flintstones = flintstones_hash

puts flintstones.inspect
