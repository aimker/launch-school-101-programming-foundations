require 'yaml'

$messages = YAML::load(File.open('mortgage_messages.yml'))

def prompt(message)
  puts "=> #{message}"
end

def number?(num)
  if num.to_f.to_s == num || num.to_i.to_s == num
    true
  else
    false
  end
end

def float_or_int_format(num) #Method for nicer output formatting.
  if num.to_f - num.to_i == 0
    num.to_i
  else
    num.to_f.round(2)
  end
end

prompt($messages[:welcome])


loop do
  loan_amount = ''
  apr = ''
  loan_duration_years = ''

  loop do
    prompt($messages[:insert_amount])
    loan_amount = gets.chomp
    if number?(loan_amount)
      loan_amount = loan_amount.to_f #Loan amount in float format.
      break
    else
      prompt($messages[:invalid_input])
    end
  end

  loop do
    prompt($messages[:insert_apr])
    apr = gets.chomp
    if number?(apr)
      break
    else
      prompt($messages[:invalid_input])
    end
  end

  loop do
    prompt($messages[:insert_duration])
    loan_duration_years = gets.chomp
    if number?(loan_duration_years)
      break
    else
      prompt($messages[:invalid_input])
    end
  end

  monthly_interest = apr.to_f/100/12 #monthly interenst in decimal format.
  loan_duration_months = (loan_duration_years.to_f * 12).ceil # Loan duration in months.

  monthly_payment = ((loan_amount * (monthly_interest * (monthly_interest + 1) ** loan_duration_months)) / (((monthly_interest + 1) ** loan_duration_months) - 1)).round(2)

  result = <<-RES
  --------------------------------
  For
  Loan Amount: #{float_or_int_format(loan_amount)} $
  Annual Percentage Rate (APR): #{apr.to_f} %
  Loan Duration: #{float_or_int_format(loan_duration_years)} years
  --------------------------------
  Monthly Payment is #{float_or_int_format(monthly_payment)} $.
  --------------------------------
  RES

  puts result

  prompt($messages[:another_calculation])
  answer = gets.chomp
  if answer.downcase != 'y'
    prompt($messages[:goodbye])
    break
  end
end
