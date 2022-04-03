class Player
    attr_reader :name, :symbol
    def initialize(name, symbol)
        @name = name
        @symbol = symbol
    end

end

def play_game(grid, tokens, player_one, player_two)
    until tokens == 9 do
        if tokens.even? == true
            play_round(grid, tokens, player_one)
        else
            play_round(grid, tokens, player_two)
        end
        tokens += 1
    end
    puts "Unfortunately, the game was a tie."
    another_round()
end

def play_round(grid, tokens, player)
    grid[choose_spot(grid, player)] = player.symbol
    display_grid(grid)
    check_game_state(grid, player)
end

def choose_spot(grid, player)
    puts "#{player.name}, where do you want to place your token?"
    position = gets.chomp.to_i
    until grid.index(position) != nil do
        puts "Invalid position, please enter a valid spot."
        position = gets.chomp.to_i
    end
    grid.index(position)    
end

def check_game_state(grid, player)
    if ((grid.values_at(0, 1, 2).all?(player.symbol)) || (grid.values_at(0, 3, 6).all?(player.symbol)) ||
        (grid.values_at(1, 4, 7).all?(player.symbol)) || (grid.values_at(2, 5, 8).all?(player.symbol)) ||
        (grid.values_at(3, 4, 5).all?(player.symbol)) || (grid.values_at(6, 7, 8).all?(player.symbol)) ||
        (grid.values_at(0, 4, 8).all?(player.symbol)) || (grid.values_at(2, 4, 6).all?(player.symbol)))
        puts "Congratulations #{player.name}, you won!"
        another_round()
    end
end

def players_identity()
    puts "Time for a nice game of good ol\' TicTacToe!\nPlayer 1, enter your name."
    name1 = gets.chomp
    until (name1 != '') do
        puts "Invalid name, please choose a different one."
        name1 = gets.chomp
    end
    puts "Hello #{name1}, choose a one-character symbol to represent you on the board."
    symbol1 = gets.chomp
    until ((symbol1 != '') && (symbol1.length == 1)) do
        puts "Invalid symbol, please choose a different one."
        symbol1 = gets.chomp
    end
    puts "Player 2, enter your name."
    name2 = gets.chomp
    until ((name2 != name1) && (name2 != '')) do
        puts "Invalid name, please choose a different one."
        name2 = gets.chomp
    end
    puts "Hello #{name2}, choose a one-character symbol to represent you on the board."
    symbol2 = gets.chomp
    until ((symbol2 != symbol1) && (symbol2 != '') && (symbol2.length == 1)) do
        puts "Invalid symbol, please choose a different one."
        symbol2 = gets.chomp
    end
    return name1, symbol1, name2, symbol2
end

def another_round()
    puts "Would you like to play another round?\nType y for yes and n for no."
    answer = gets.chomp
    until ((answer == "y") || (answer == "n"))
        puts "I\'sorry, I didn\'t catch that.\nWould you like to play another round?\nType y for yes and n for no."
        answer.gets.chomp
    end
    if answer == "y"
        start_game()
    elsif answer == "n"
        exit
    end
end

def display_grid(grid)
    puts grid.slice(0, 3).join(" | ") + "\n--+---+--\n\n" + grid.slice(3, 3).join(" | ") + "\n--+---+--\n\n" + grid.slice(6, 3).join(" | ")
end

def start_game()
    grid = Array.new(9) { | i | i + 1}
    tokens = 0
    
    name1, symbol1, name2, symbol2 = players_identity()
    player_one = Player.new(name1, symbol1)
    player_two = Player.new(name2, symbol2)
    display_grid(grid)
    play_game(grid, tokens, player_one, player_two)
end

start_game()