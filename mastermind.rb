class Board
  require 'active_support/core_ext/integer/inflections'
  attr_accessor :code, :guesses
  def initialize
    @code = []
    @guesses = 0
    @game_status = "active"
    @game_type = "guesser"
  end
  
  def start_game
    puts "Enter 1 to guess or 2 to set the code"
    option = gets.to_i
    if option == 1
      @game_type = "guesser"
      
    elsif option == 2
      @game_type = "chooser"
      
    else 
      puts "Invalid Choice"
      self.start_game
    end
    
    if @game_type == "guesser"
      (1..4).each do
        @code.push (1 + rand(6))
      end
      
    else
      self.set_code
      
      
    end
  end
  
  def set_code
    puts "Choose 4 numbers 1 to 6 separated by a space"
    gets.split.each { |choice| @code.push(choice.to_i) }
    if @code.length !=4
      puts "Incorrect code length"
      @code = []
      self.set_code
    else
      self.verify_choices
    end
  end
  
  
  def verify_choices
    (0..3).each do |idx|
      if @code[idx].between?(1,6)
        next
      else
        puts "Your #{(idx + 1).ordinalize} choice of #{@code[idx]} is not valid please choose a new choice between 1 and 6"
        @code[idx] = gets.to_i
        self.verify_choices
      end
    end
  end


  def reset
    @code = []
    @guesses = 0
  end
  
  
  
end
  

