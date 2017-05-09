class Board
  require 'active_support/core_ext/integer/inflections'
  attr_accessor :code, :guesses
  def initialize
    @code = []
    @guesses = 0
    @game_status = "active"
    @game_type = "guesser"
    @markers = []
  end

  def start_game
    self.reset
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
      self.guesser_game

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
    @markers = []
  end

  def get_guess(position)
    guess = 0
    until guess.between?(1,6)
      puts "What is in the #{position.ordinalize} position? (choose between 1 and 6)"
      guess = gets.to_i
    end
    return guess
  end

  def check_guess(guess)
    matched = []
    @markers = []
    #check for exact matches
    (0..3).each do |idx|
      if @code[idx]==guess[idx]
        matched.push(idx)
        @markers.push("black")
      end
    end
    #check for win
    if matched.length == 4
      self.win
    #check for correct choice in wrong position
    else
      unmatched = @code.dup
      matched.reverse.each {|idx| unmatched.delete_at(idx)}
      (0..3).each do |idx|
        if unmatched.include?(guess[idx])
          @markers.push("white")
          unmatched.delete_at(unmatched.index(guess[idx]))
        end
      end
    end
  end

  def win
    @game_status = "inactive"
    puts "You have chosen wisely, congratulations the code was #{@code}."
  end

  def lose
    @game_status = "inactive"
    puts "You failed to correctly guess the pattern. It was #{@code}."
  end

  def turn
    if @guesses == 12
      self.lose
    else
      current_guess = []
      (1..4).each {|pos| current_guess.push(self.get_guess(pos))}
      self.check_guess(current_guess)
      self.show_marker
      @guesses += 1
      puts "#{12 - guesses} more tries."
    end
  end

  def show_marker
    puts @markers.join(" ")
  end

  def guesser_game
    while @game_status == "active"
      self.turn
    end
  end



end
