require "rspec"
require "hanoi.rb"

describe TowerofHanoi do
    subject(:game) { TowerofHanoi.new }

    describe "#initialize" do
        it "should create three stacks" do
            expect(game.towers.count).to eq(3)
        end

        it "should start with stacks on first tower" do
            expect(game.towers[0]).to eq([3,2,1])
        end
    end

    describe "#change_pos" do
        it "should move the in to the out" do
            game.change_pos(0,1)
            expect(game.towers).to eq([[2,1],[3],[]])
        end

        it "should not move from empty tower" do
            expect { game.change_pos(2,1) }.to raise_error(ArgumentError)
        end

        it "should not allow larger disc on smaller disc" do
            game.change_pos(0,1)
            expect { game.change_pos(0,1) }.to raise_error(ArgumentError)
        end
    end

    describe "#end?" do
        it "should not end when first tower is full" do
            expect(game.end?).to be false
        end

        it "should end when a different tower is complete" do
            game.towers = [[],[3,2,1],[]]
            expect(game.end?).to be true
        end

        it "should not end for non-ordered towers" do
            game.towers = [[],[1,2,3],[]]
            expect(game.end?).to be false
        end
    end

end