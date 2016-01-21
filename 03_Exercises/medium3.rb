## QUESTION 1

# The first set of output has the initial ids before the block.
# Outer_inner values are the same as outer, so the second set of output has the same respective object_ids as the outer variables and the first set of output.
# In the third set of output, outer variables are reassigned new values, so they have new object_ids.
# In the fourth set of output, the inner variables have the same object_ids as those of the reassigned outer values.
# In the fifth set of output, the initial and reassigned values of outer values are presented.
# In the sixth set, because the inner variables are created inside the loop (hence they have a local scope inside the loop), an error is presented.
# The app does not crash, because of the rescue statements.

## QUESTION 2

# The first set of output in fun_with_ids has the initial ids before the block.
# an_illustrative_method is called, with outer values and object_ids as arguments
# The outer_inner values, that are assigned inside the new method, are the same as outer, so the second set of output has the same respective object_ids as the outer variables and the first set of output.
# In the next set of output, outer variables are reassigned new values (inside an_illustrative_method), so they have new object_ids.
# In the next set of output, the inner variables have the same object_ids as those of the reassigned outer values.
# Now the rest of the code inside the fun_with_ids is executed.
# In the next set of output, the initial and reassigned values of outer values are presented.
# However, because the modifications that took place in an_illustrative_method are not "carried" in the rest of our implementation, outer variables still hold the initial values and object_ids.
# In the sixth and final set, because the inner variables are created inside an_illustrative_method (hence they have a local scope inside the method), an error is presented.
# The app does not crash, because of the rescue statements.


## QUESTION 3
# What is displayed is the following:

# My string looks like this now: pumpkins
# My array looks like this now: ["pumpkins", "rutabaga"]

# We get that string, because the assignment operator '=' does not mutate the caller.
# On the other hand, the shovel '<<' operator mutates the caller. So we get the array with the additional element.
# It is also worth noting that since no explicit return is made in the tricky_method, the last line is returned.
# That means that if we run the method, only the modified array is returned.

## QUESTION 4

# What is displayed now is the following:

# My string looks like this now: rutabaga
# My array looks like this now: ["pumpkins"]

# This time we have a modified string, and an array that remained the same.
# Similarly to the previous question, this happens because gsub! mutates the caller, so it mutates what was passed as an argument.
# The assignment operator does not mutate the caller, but it creates a new local variable with a scope inside the method, that is assigned a new value.
# So the array that we passed as an argument was not modified.

## QUESTION 5

# Instead of:

def color_valid(color)
  if color == "blue" || color == "green"
    true
  else
    false
  end
end

# We could write

def color_valid(color)
  color == "blue" || color == "green"
end

# This statement will be directly evaluated, and because it is the last line of the method, before end, the result is what the method will return.
