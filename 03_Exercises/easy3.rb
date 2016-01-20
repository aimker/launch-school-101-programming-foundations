## QUESTION 1
flintstones = ["Fred", "Barney", "Wilma", "Betty", "BamBam", "Pebbles"]
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

## QUESTION 2
flintstones.push("Dino")

## QUESTION 3
flintstones.push("Dino", "Hoppy")

## QUESTION 4
advice = "Few things in life are as important as house training your pet dinosaur."
advice.slice!(0, advice.index("house"))

# If we use advice.slice instead of slice!, the advice variable will remain as is.

## QUESTION 5
statement = "The Flintstones Rock!"
statement.split(//).count("t")

## QUESTION 6
title = "Flintstone Family Members"
title.center(40)
