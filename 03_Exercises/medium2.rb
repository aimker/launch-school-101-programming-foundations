## QUESTION 1

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" }
}

total_male_age = 0
munsters.each_value{ |hash| hash["gender"] == "male" ? total_male_age += hash["age"] : total_male_age}

puts "---------- QUESTION 1 ----------"
puts total_male_age

## QUESTION 2

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" }
}
puts "---------- QUESTION 1 ----------"
munsters.each {|name, details| puts "#{name} is a #{details["age"]} year old #{details["gender"]}."}

## QUESTION 3

def tricky_method(a_string_param, an_array_param)
  a_string_param += "rutabaga"
  an_array_param += ["rutabaga"]

  return a_string_param, an_array_param
end

my_string = "pumpkins"
my_array = ["pumpkins"]
my_string, my_array = tricky_method(my_string, my_array)

puts "---------- QUESTION 3 ----------"
puts "My string looks like this now: #{my_string}"
puts "My array looks like this now: #{my_array}"

## QUESTION 4
sentence = "Humpty Dumpty sat on a wall."
puts "---------- QUESTION 1 ----------"
puts sentence.split(/[. ]/).reverse.join(" ") + '.'

## QUESTION 5

# The answer is 34, the method called does not modify the answer variable.

## QUESTION 6

# The family data was modified, because the method modified argument (the munsters hash) directly.
# This could have been avoided if a local variable was declared in the beginning of the method implementation, in which a local copy of munsters was assigned.

## QUESTION 7

# The answer is "paper".

## QUESTION 8
 # The answer is "no".
