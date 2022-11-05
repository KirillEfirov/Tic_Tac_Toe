class Field
    @@array

    def initialize
        @@array = [[1,2,3], [4,5,6], [7,8,9]]
    end

    def change_field(sigil); end

    def display_field
        @@array.each_with_index do |item, index|
            #puts "-----" if index > 0
            puts item.each { |elem| elem }.join("_|_")
        end
    end

    def check_winner; end
    
end