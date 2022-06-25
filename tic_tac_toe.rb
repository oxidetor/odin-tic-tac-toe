class Cell
  @@cell_count = 0
  attr_accessor :value

  def initialize
    @cell_id = @@cell_count
    @@cell_count += 1
    self.value = '_'
  end

  def value=(new_value)
    @value ||= new_value
  end
end

class Player
  def initialize(player_number)
    @player_number = player_number
    @marker = player_number == 1 ? 'X' : 'O'
  end

  def move(square_number); end
end

class Game
  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @current_player = player1
    @cells = []
    9.times do
      @cells.push(Cell.new)
    end
  end

  def play_game
    play_turn
  end

  def play_turn
    draw_board('GAME', @cells.map(&:value))
    draw_board('KEY', (1..9).to_a)
    selection = get_player_selection
    @cells[selection - 1].value = @current_player == @player1 ? 'X' : 'O'
  end

  def draw_board(type, values)
    print "\t----------\t#{type}\t----------"
    values.each_with_index do |value, index|
      print "\n\n\n" if index % 3 == 0
      print "\t#{value}\t"
    end
    print "\n\n\n"
  end

  def get_player_selection
    puts 'Input a number (1-9) that corresponds to the square you want to play'
    gets.chomp.to_i
  end
end

player1 = Player.new(1)
player2 = Player.new(2)
game = Game.new(player1, player2)
game.play_game