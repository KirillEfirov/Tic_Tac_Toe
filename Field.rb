class Field
    @@array

    def initialize
        @@array = [[1,2,3], [4,5,6], [7,8,9]]
    end

    def change_field(sigil)

    end

    def display_field
        @@array.each do |item|
            puts item.each { |elem| elem }.join(" ")
        end
    end

    
end