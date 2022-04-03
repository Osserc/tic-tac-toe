class Player
    attr_accessor :name, :symbol
    def initialize(name, symbol)
        @name = name
        @symbol = symbol
    end

end

def play_round(grid, player_one, player_two)
    position_grid = choose_spot(grid, player_one, player_two)
    grid[position_grid] = player_one.symbol
    display_grid(grid)
end

def choose_spot(grid, player_one, player_two)
    puts player_one.name + ", where do you want to place your token?"
    position = gets.chomp.to_i
    until grid.index(position) != nil do
        puts "Invalid position, please enter a valid spot."
        position = gets.chomp.to_i
    end
    position_grid = grid.index(position)    
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
end

grid = Array.new(9) { | i | i + 1}
tokens = 0
display_grid(grid)
# name1, symbol1, name2, symbol2 = players_identity()
# player_one = Player.new(name1, symbol1)
# player_two = Player.new(name2, symbol2)
player_one = Player.new("Frodo", "F")
player_two = Player.new("Sam", "S")
play_round(grid, player_one, player_two)