## For the needs of question 4 of calculator bonus.
require 'yaml'

messages = {:en => {:welcome => "Welcome to Calculator! Enter your name: ",
                    :valid_name => "Make sure to use a valid name.",
                    :hi_name => "Hi",
                    :first_number_q => "What's the first number?",
                    :second_number_q => "What's the second number?",
                    :invalid_number => "Hmm... That does not look like a valid number.",
                    :operator_prompt => "What operation would you like to perform?\n
                                        1) add\n
                                        2) subtract\n
                                        3) multiply\n
                                        4) divide",
                    :invalid_operator => 'Must choose 1, 2, 3 or 4.',
                    :adding => "Adding",
                    :subtracting => "Subtracting",
                    :multiplying => "Multiplying",
                    :dividing => "Dividing",
                    :operation_progress => "the two numbers...",
                    :nonexistent => "non-existent",
                    :result => "The result is",
                    :another_calculation => "Do you want to perform another calculation? (Y to calculate again)",
                    :thank_you => 'Thank you for using the calculator. Good bye!'},

            :es => {:welcome => "Bienvenido a Calculator! Entra tu nombre: ", # Rest of spanish translation is incomplete.
                    :valid_name => "Make sure to use a valid name.",
                    :hi_name => "Hi",
                    :first_number_q => "What's the first number?",
                    :second_number_q => "What's the second number?",
                    :invalid_number => "Hmm... That does not look like a valid number.",
                    :operator_prompt => "What operation would you like to perform?\n
                                        1) add\n
                                        2) subtract\n
                                        3) multiply\n
                                        4) divide",
                    :invalid_operator => 'Must choose 1, 2, 3 or 4.',
                    :adding => "Adding",
                    :subtracting => "Subtracting",
                    :multiplying => "Multiplying",
                    :dividing => "Dividing",
                    :operation_progress => "the two numbers...",
                    :nonexistent => "non-existent",
                    :result => "The result is",
                    :another_calculation => "Do you want to perform another calculation? (Y to calculate again)",
                    :thank_you => 'Thank you for using the calculator. Good bye!'},
}

output = File.new('messages.yml', 'w')
output.puts YAML.dump(messages)
output.close
