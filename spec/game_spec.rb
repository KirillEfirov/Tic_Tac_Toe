require "./game.rb"

describe "#game" do
    context "testing Field class" do
        it "should set up a field" do
            field = Field.new
            expect(field.array).to be == [[1,2,3], [4,5,6], [7,8,9]]
            expect(field.winner).to be false
        end

        it "should update a field" do
            field = Field.new
            field.change_field(3, "k")
            expect(field.array).to be == [[1,2,"k"], [4,5,6], [7,8,9]]
        end

        it "shouldn't update a field" do
            field = Field.new
            field.change_field(-1, "k")
            expect(field.array).to be == [[1,2,3], [4,5,6], [7,8,9]]
        end

        it "shouldn't make winner true" do
            field = Field.new
            field.array = [["l","k","l"], ["k",5,"k"], [7,"l",9]]
            field.check_field("l","k")
            expect(field.winner).to be false
        end

        it "should make winner true" do
            field = Field.new
            field.array = [["l",2,"l"], ["k","k","k"], [7,"l",9]]
            field.check_field("l","k")
            expect(field.winner).to be true
        end
    end
end