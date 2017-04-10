def caesar_cipher
  puts "What text do you want to code?"
  text = gets.chomp.to_s
  puts "How far do you want to shift?"
  shift = gets.chomp.to_i
  #puts text
  #puts shift
  letters = text.split("")
  letter_values = Hash.new
  #p letters
  ('a'..'z').zip(0..25).each do |pair|
    letter_values[pair[1]]=pair[0]
    letter_values[pair[0]]=pair[1]
  end
  #puts letter_values

  shifted_string=""

  letters.each do |letter|
    #puts letter
    if letter.match(/[^a-zA-Z]/)
      shifted_string << letter

    elsif letter.match(/[A-Z]/)
      shifted_string << letter_values[(letter_values[letter.downcase]-shift)%26].upcase

    else
      shifted_string << letter_values[(letter_values[letter]-shift)%26]

    end
  end

  puts shifted_string
end
