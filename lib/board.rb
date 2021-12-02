# frozen_string_literal: false

require 'ansi/code'

# most of the tic tac toe game
class Game
  def initialize
    @board_data = Array.new(9)
    @players = %w[X O]
  end

  def play
    @players.cycle do |player|
      print_board
      player_move(player)

      if player_won?(player)
        print_board
        puts "Player #{player} wins!"
        break
      end
      unless @board_data.any?(nil)
        print_board
        puts "Cats game :3\nTie!"
        break
      end
    end
  end

  private

  def print_board
    board = @board_data.map.with_index { |tile, index| tile.nil? ? index + 1 : tile }
    puts \
      "\n #{player_color(board[0])} │ #{player_color(board[1])} │ #{player_color(board[2])}\n"\
        "───┼───┼───\n"\
      " #{player_color(board[3])} │ #{player_color(board[4])} │ #{player_color(board[5])}\n"\
        "───┼───┼───\n"\
      " #{player_color(board[6])} │ #{player_color(board[7])} │ #{player_color(board[8])}\n\n"\
  end

  def ask_player(prompt)
    print prompt
    gets
  end

  def player_color(player)
    case @players.index(player)
    when 0
      "#{ANSI.blue}#{player}#{ANSI.reset}"
    when 1
      "#{ANSI.red}#{player}#{ANSI.reset}"
    else
      "#{ANSI.white}#{player}#{ANSI.reset}"
    end
  end

  def player_move(player)
    return nil unless @players.include?(player)

    puts "Player #{player}, choose an open tile:"
    position = nil
    loop do
      position = ask_player("[#{player_color(player)}]:").to_i

      unless position.between?(1, 9)
        puts "#{ANSI.red}ERROR: Invalid position. Please choose a number between 1 and 9#{ANSI.reset}"
        next
      end

      unless @board_data[position - 1].nil?
        puts "#{ANSI.red}ERROR: Please choose a positon not already taken#{ANSI.reset}"
        next
      end

      break
    end

    @board_data[position - 1] = player
  end

  def player_won?(player)
    # diagonals
    if @board_data.values_at(0, 4, 8) == [player, player, player] ||
       @board_data.values_at(2, 4, 6) == [player, player, player]
      return true
    end

    # rows
    if @board_data.values_at(0, 1, 2) == [player, player, player] ||
       @board_data.values_at(3, 4, 5) == [player, player, player] ||
       @board_data.values_at(6, 7, 8) == [player, player, player]
      return true
    end

    # columns
    if @board_data.values_at(0, 3, 6) == [player, player, player] ||
       @board_data.values_at(1, 4, 7) == [player, player, player] ||
       @board_data.values_at(2, 5, 8) == [player, player, player]
      return true
    end
  end
end
