require_relative 'Field.rb'
require_relative 'Player.rb'

def game
    field = Field.new

    field.display_field

    puts

    player1 = Player.new
    print "Hi Plsyer_1! What's your name? "
    player1.name = gets.chomp
    print "Choose the sigil to play: "
    player1.sigil = gets.chomp

    player2 = Player.new
    print "Hi Player_2! What's your name? "
    player2.name = gets.chomp
    print "Choose the sigil to play: "
    player2.sigil = gets.chomp

    puts "#{player1.name} " + "your sigil is" + " #{player1.sigil}"
    puts "#{player2.name} " + "your sigil is" + " #{player2.sigil}"

    puts "Let's start!"

    puts

    loop do
        puts "Choose position to move: "
        print "Player 1: "
        player1.move = gets.chomp.to_i

        while !field.include_move?(player1.move)
            puts "Position is occupied. Choose another one..."
            print "Player 1: "
            player1.move = gets.chomp.to_i
        end

        field.change_field(player1.move, player1.sigil)
        field.display_field
        field.check_rows(player1.sigil, player2.sigil)
        field.check_columns(player1.sigil, player2.sigil)
        field.check_diagonals(player1.sigil, player2.sigil)

        puts "Player_1 is winner" if Field.winner == true
        break if (Field.winner == true || field.is_draw?)

        puts "Choose position to move: "
        print "Player 2: "
        player2.move = gets.chomp.to_i

        while !field.include_move?(player2.move)
            puts "Position is occupied or doesn't exist. Choose another one..."
            print "Player 2: "
            player2.move = gets.chomp.to_i
        end

        field.change_field(player2.move, player2.sigil)
        field.display_field
        field.check_rows(player1.sigil, player2.sigil)
        field.check_columns(player1.sigil, player2.sigil)
        field.check_diagonals(player1.sigil, player2.sigil)

        puts "Player_1 is winner" if Field.winner == true
        break if Field.winner == true
    end

    puts "Draw" if field.is_draw?
end

game