

loop do
  print "Insert first number: "
  first_number = gets.chomp.to_i
  print "Insert second number: "
  second_number = gets.chomp.to_i

  print "Type: (1) to add, (2) to subtract, (3) to multiply, (4) to divide: "
  operation = gets.chomp.to_i
  
  if operation == 1
    puts "#{first_number + second_number}"
  elsif operation == 2
    puts "#{first_number - second_number}"
  elsif operation == 3
    puts "#{first_number * second_number}"
  elsif operation == 4
    if second_number !=0
    puts "#{first_number.to_f / second_number.to_f}"
    elsif
    puts "Wrong input. Please try again."
    next
    end
  else
    puts "Wrong input. Please try again."
    next
  end

  puts "----------"
  print "Do you want to do another operation? (Type y for yes): "
  another = gets.chomp.downcase
  if another == 'y'
    next
  else
    puts "OK, no problem."
    break
  end
end
