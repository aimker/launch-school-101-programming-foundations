require 'yaml'

$input = YAML::load(File.open('calculator_messages.yml')) #Loads the contents of the messages.yml YAML file

def prompt(message)
  puts "=> #{message}"
end

def valid_number?(num)
  #num.to_i != 0
  %w(0 1 2 3 4 5 6 7 8 9).include?(num.split(//).first) # 1st question
end

def number?(num) # 2nd question
  num.to_f.to_s == num || num.to_i.to_s == num
end

def operation_to_message(op)
  #messages = YAML::load(File.open('messages.yml'))
  operation = case op #Assigned the returned text to a local variable called operation (Question 3).
              when '1'
                $messages[:adding]
              when '2'
                $messages[:subtracting]
              when '3'
                $messages[:multiplying]
              when '4'
                $messages[:dividing]
              end

  return operation
end

language = ''
prompt("Please, select your language: ")
puts ("(en): English, (es) Español")

loop do
  language = gets.chomp.downcase
  if language == "en"
    $messages = $input[:en]
    prompt("Loading...")
    break
  elsif language == "es"
    $messages = $input[:es]
    prompt("Cargando...")
    break
  else
    prompt("Please choose a correct language.")
  end
end


prompt($messages[:welcome])

name = ''
loop do
  name = gets.chomp
  if name.empty?
    prompt($messages[:valid_name])
  else
    break
  end
end

prompt("#{$messages[:hi_name]} #{name}!")

loop do #main loop

  number1 = ''
  number2 = ''

  loop do
    prompt($messages[:first_number_q])
    number1 = gets.chomp
    if number? (number1)
      break
    else
      prompt($messages[:invalid_number])
    end
  end

  loop do
    prompt($messages[:second_number_q])
    number2 = gets.chomp
    if number? (number2)
      break
    else
      prompt($messages[:invalid_number])
    end
  end

  prompt($messages[:operator_prompt])

  operator = ''
  loop do
    operator = gets.chomp
    if %w(1 2 3 4).include?(operator)
      break
    else
      prompt($messages[:invalid_operator])
    end
  end


  prompt("#{operation_to_message(operator)} #{$messages[:operation_progress]}")

  result = case operator
           when '1'
             if ((number1.to_f - number1.to_i) != 0) || ((number2.to_f - number2.to_i) != 0) #Condition that checks if a number from the two is a float. (For Question 2)
               (number1.to_f + number2.to_f).round(4)
             else
               number1.to_i + number2.to_i
             end
           when '2'
             if ((number1.to_f - number1.to_i) != 0) || ((number2.to_f - number2.to_i) != 0)
               (number1.to_f - number2.to_f).round(4)
             else
               number1.to_i - number2.to_i
             end
           when '3'
             if ((number1.to_f - number1.to_i) != 0) || ((number2.to_f - number2.to_i) != 0)
               (number1.to_f * number2.to_f).round(4)
             else
               number1.to_i * number2.to_i
             end
           when '4'
             if number2.to_f != 0
               (number1.to_f / number2.to_f).round(4)
             else
               $messages[:nonexistent]
             end
  end



  prompt("#{$messages[:result]} #{result}.")

  prompt($messages[:another_calculation])
  answer = gets.chomp

  break unless answer.downcase.start_with?('y')

end

prompt ($messages[:thank_you])
