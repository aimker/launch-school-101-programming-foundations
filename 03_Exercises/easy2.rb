## QUESTION 1

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }

ages.has_key?("spot")
ages.key?("spot")
ages.member?("spot")

## QUESTION 2

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }
age_sum = 0

ages.each_value {|age| age_sum = age_sum + age}

puts age_sum

## QUESTION 3

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }
ages.delete_if{|_, value| value > 100}

puts ages.inspect

## QUESTION 4

munsters_description = "The Munsters are creepy in a good way."

puts munsters_description.inspect
puts munsters_description.swapcase.inspect
puts munsters_description.downcase.inspect
puts munsters_description.upcase.inspect

## QUESTION 5
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10 }
additional_ages = { "Marilyn" => 22, "Spot" => 237 }

ages.merge!(additional_ages)

## QUESTION 6

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }

min_age = ages.values.min # OR min_age = ages.values.sort.first
ages.key(min_age)

## QUESTION 7

advice = "Few things in life are as important as house training your pet dinosaur."
advice.include?("Dino")

## QUESTION 8

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

flintstones.index{ |x| x[0..1] == "Be" }

## QUESTION 9
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

flintstones.map! do |name|
  name[0,3]
end

puts flintstones.inspect

## QUESTION 10
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

flintstones.map! {|name| name[0,3]}
