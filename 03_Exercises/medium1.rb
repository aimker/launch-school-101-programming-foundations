## QUESTION 1
phrase = "The Flintstones Rock!"
puts "---------- QUESTION 1 ----------"
10.times do
  puts phrase.prepend(' ')
end

## QUESTION 2

statement = "The Flintstones Rock"
letter_frequency = {}

statement.split(//).each do |letter|
  if letter != " "
    if letter_frequency.has_key?(letter)
      letter_frequency[letter] += 1
    else
      letter_frequency[letter] = 1
    end
  end
end

letter_frequency = letter_frequency.sort.to_h

puts "---------- QUESTION 2 ----------"
puts letter_frequency.inspect


## QUESTION 3

# The error TypeError: no implicit conversion of Fixnum into String is raised, because 42 is an integer and we try to merge it with a string.
# There are two possible ways to fix this:
puts "---------- QUESTION 3 ----------"
puts "the value of 40 + 2 is #{40 + 2}"
puts "the value of 40 + 2 is " + (40 + 2).to_s

## QUESTION 4

# In the first piece of code, in the first iteration, the number in index 0 is printed and then deleted.
# The array after the first iteration will be [2, 3, 4].
# In the second iteration, the number in index 1 is printed and the number in index 0 is deleted. But now, the number in index 1 is 3, not 2.
# So 2 will be deleted, and 3 will be printed. Overall, 1 and 3 will be printed, and the final array will be [3, 4].

# In the second piece of code, in the first iteration, the number in index 0 is printed and the last is deleted.
# The array after the first iteration will be [1, 2, 3].
# In the second iteration, the number in index 1 is printed and the number in index 2 is deleted.
# So 3 will be deleted, and 2 will be printed. Overall, 1 and 2 will be printed, and the final array will be [1, 2].

## QUESTION 5

def factors(number)
  dividend = number
  divisors = []
  while dividend > 0
    divisors << number / dividend if number % dividend == 0
    dividend -= 1
  end
  divisors
end

# Bonus 1: The 'if number % dividend == 0' statement ensures that the division taking place does not leave any remainders (is an integer), so the result is indeed a divisor.
# Bonus 2: Unless explicitly told, the last statement in a method is what the method will return. Since what we want to return is the divisors array, we put this line in the end.

## QUESTION 6

# Yes, there is a difference between the two implementations.
# In the first implementation, the input is modified by the method.
# In the second one, buffer is a seperate local variable that is equal to the input, plus any new element.

## QUESTION 7

# The limit variable is outside the scope of the fib method.

# To fix the error, we could pass the limit as an extra argument, like below:

def fib(first_num, second_num, limit)
  while second_num < limit
    sum = first_num + second_num
    first_num = second_num
    second_num = sum
  end
  sum
end

result = fib(0, 1, 15)
puts "---------- QUESTION 7 ----------"
puts "result is #{result}"

# Another fix would be to set the limit variable as a global variable ($limit), though this is not preferred.

## QUESTION 8

movie_title = "the force awakens"

def titleize(title)
  title = title.split.map do |word|
            word.capitalize
          end
  title.join(" ")
end

puts "---------- QUESTION 8 ----------"
puts "With titleize: #{titleize(movie_title)}"
puts "Without titleize: #{movie_title}"

## QUESTION 9

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

infinity = 1.0/0.0

munsters.each_value do |hash|
  case hash["age"]
  when 0..17
    hash["age_group"] = "kid"
  when 18..64
    hash["age_group"] = "adult"
  when 65..infinity ## range till infinity added, instead of a simple else, in the case that a negative age is mistakenly inserted.
    hash["age_group"] = "senior"
  end
end

puts "---------- QUESTION 9 ----------"
puts munsters
