class Player
    attr_accessor :name, :symbol
    def initialize(name, symbol)
        @name = name
        @symbol = symbol
    end

end

def Token

    @@number_of_tokens = 0

    def initialize

        @@number_of_tokens += 1
    end
end

def players_name()
    puts "Choose a name"
    name = gets.chomp
end

def players_symbol()
    puts "Choose a symbol"
    symbol = gets.chomp
end


def players_identity()
    puts "Player 1, enter your name"
    name1 = gets.chomp
    puts "Hello #{name1}, choose a symbol to represent you on the board"
    symbol1 = gets.chomp
    puts "Player 2, enter your name"
    name2 = gets.chomp
    puts "Hello #{name2}, choose a symbol to represent you on the board"
    symbol2 = gets.chomp
    return name1, symbol1, name2, symbol2
end

def display_grid(grid)
    puts grid.slice(0, 3).join(" | ") + "\n_________\n\n" + grid.slice(3, 3).join(" | ") + "\n_________\n\n" + grid.slice(6, 3).join(" | ")
    # puts "_________\n\n"
    # puts grid.slice(3, 3).join(" | ")
    # puts "_________\n\n"
    # puts grid.slice(6, 3).join(" | ")
end

grid = Array.new(9) { | i | i + 1}
display_grid(grid)
name1, symbol1, name2, symbol2 = players_identity()
player_one = Player.new(name1, symbol1)
player_two = Player.new(name2, symbol2)
puts player_one.name + " " + player_one.symbol
puts player_two.name + " " + player_two.symbol