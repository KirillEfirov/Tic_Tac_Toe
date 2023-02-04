require_relative 'Field.rb'
require_relative 'Player.rb'

def game
    field = Field.new

    puts "Player 1:"
    player1 = Player.new

    puts "Player 2:"
    player2 = Player.new

    while player1.sigil == player2.sigil
      print "Choose another sigil to play: "
      player2.sigil = gets.chomp
    end

    puts "\n\n#{player1.name}(#{player1.sigil}) vs #{player2.name}(#{player2.sigil})"
    
    puts "\n\nLet's start!\n"

    field.display_field

    puts

    loop do
        puts "\nChoose position to move: "
        print "#{player1.name}(#{player1.sigil}): "
        player1.move = gets.chomp.to_i

        while !field.include_move?(player1.move)
            puts "Position is occupied. Choose another one..."
            print "#{player1.name}(#{player1.sigil}): "
            player1.move = gets.chomp.to_i
        end

        field.change_field(player1.move, player1.sigil)
        field.display_field
        field.check_rows(player1.sigil, player2.sigil)
        field.check_columns(player1.sigil, player2.sigil)
        field.check_diagonals(player1.sigil, player2.sigil)

        puts "\n******#{player1.name} is winner*****\n" if field.winner == true
        break if (field.winner == true || field.is_draw?)

        puts "\nChoose position to move: "
        print "#{player2.name}(#{player2.sigil}): "
        player2.move = gets.chomp.to_i

        while !field.include_move?(player2.move)
            puts "Position is occupied or doesn't exist. Choose another one..."
            print "#{player2.name}(#{player2.sigil}): "
            player2.move = gets.chomp.to_i
        end

        field.change_field(player2.move, player2.sigil)
        field.display_field
        field.check_rows(player1.sigil, player2.sigil)
        field.check_columns(player1.sigil, player2.sigil)
        field.check_diagonals(player1.sigil, player2.sigil)

        puts "\n*****#{player2.name} is winner*****\n" if field.winner == true
        break if field.winner == true
    end

    puts "\n*****Draw*****\n" if field.is_draw?
end