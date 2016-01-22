## QUESTION 1

if false
  greeting = “hello world”
end

greeting

# The value of greeting is nil.
# Any undeclared variables in if blocks are initialized.
# If they are not given a value inside the block, the value is nil.
# For example, if instead of "if false", we had "if true", the value of greeting would be "hello world"

## QUESTION 2

# The resulting hash will be {:a=>"hi there"}

# greetings[:a] points at a specific space in memory
# When we declare informal_greeting = greetings[:a], informal_greeting refers to the same space in memory.
# This point in memory has the value "hi"
# When we use the shovel operator, informal_greeting is not reassigned, so what is modified is the string in that point in memory.
# So now both greetings[:a] and informal_greeting refer to a point in memory with the value "hi there"

## QUESTION 3

# In the first two code groups, we have the following output.

# one is: one
# two is: two
# three is: three

# That is because inside the mess_with_vars method, what appears to be the "reassignment" of one, two, and three variables
# is essentially the declaration of new local variables with a scope inside the method.
# What is used from the arguments are the values, not the references to the actual objects.

# In the third code group, instead of the assignment operator, gsub! is used.
# What gsub! does is access the original object, so the original values are replaced with new ones.
# So, the output in the third code group is the following:

# one is: two
# two is: three
# three is: one

## QUESTION 4

# With using SecureRandom module
require 'SecureRandom'

def gen_uuid
  SecureRandom.uuid
end

random_id = gen_uuid
puts "UUID using the SecureRandom module: "
prints random_id

# Without using SecureRandom module

def get_uuid
  characters = ('0'..'9').to_a + ('a'..'f').to_a
  dash_positions = [8, 13, 18, 23]
  uuid = []

  32.times do
    uuid.push(characters.sample)
  end
  uuid.each_with_index{ |char, ind| uuid.insert(ind, '-') if dash_positions.include?(ind) }
  uuid.join
end

random_id = get_uuid
puts "UUID without using the SecureRandom module: "
puts random_id

## QUESTION 5

def is_a_number?(num)
  num.to_f.to_s == num || num.to_i.to_s == num
end

def dot_separated_ip_address?(input_string)
  dot_separated_words = input_string.split(".")
  return false if dot_separated_words.length != 4
  dot_separated_words.each{|word| return false unless (0..255).include?(word.to_i)}
  while dot_separated_words.size > 0  do
      word = dot_separated_words.pop
      return false unless is_a_number?(word)
    end
  return true
end
