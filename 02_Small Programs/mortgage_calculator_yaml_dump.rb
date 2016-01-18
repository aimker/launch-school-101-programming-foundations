require 'yaml'

result = ''
messages = {:welcome => "Welcome to Mortgage Calculator!",
            :insert_amount => "Insert Loan Amount: ",
            :insert_apr => "Insert Annual Percentage Rate (APR) in x % format: ",
            :insert_duration => "Insert Loan Duration: ",
            :invalid_input => "Invalid input. Please try again.",
            :another_calculation => "Would you like to perform another calculation? (Type 'Y' for Yes).",
            :goodbye => "OK, thanks for using mortgage calculator!",
}

output = File.new('mortgage_messages.yml', 'w')
output.puts YAML.dump(messages)
output.close
