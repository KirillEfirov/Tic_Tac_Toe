class Player
    attr_accessor :name, :sigil, :move

    def initialize
        print "What's your name? "
        @name = gets.chomp
        
        print "Choose the sigil to play: "
        @sigil = gets.chomp
    end
end