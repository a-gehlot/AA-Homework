require "TDD-tests.rb"
require "rspec"

describe "#my_uniq" do
    let(:array) { [1, 2, 1, 3, 3] }
    let(:uniq_array) { my_uniq(array.dup) }

    it "removes duplicates" do
        array.each do |item|
            expect(uniq_array.count(item)).to eq(1) 
        end
    end

    it "contains all original elements" do 
        uniq_array.each do |ele|
            expect(array).to include(ele)
        end
    end
end

describe "#two_sum" do
    let(:array) { [-1, 0, 2, -2, 1] }
    let(:two_zeroes) { [-1, 0, 2, 0, 1] }

    it "finds indices of two zero sums" do
        expect(two_sum(array)).to eq([[0,4],[2,3]])
    end

    it "doesn't mistake two zeroes" do
        expect(two_sum(two_zeroes)).to eq([[0,4],[1,3]])
    end
end

describe "#my_transpose" do
    let(:rows) { [
        [0, 1, 2],
        [3, 4, 5],
        [6, 7, 8],
    ] }
    let(:columns) { [
        [0, 3, 6],
        [1, 4, 7],
        [2, 5, 8],
    ] }

    it "transposes between rows and columns" do
        expect(my_transpose(rows)).to eq(columns)
        expect(my_transpose(columns)).to eq(rows)
    end
end

describe "#stock_picker" do
    it "selects days to buy and sell a stock" do
        expect(stock_picker([0,1,2,3,4,5])).to eq([0,5])
    end

    it "does not sell before buying" do
        expect(stock_picker([7,5,4,1,6])).to eq([3,4])
    end

    it "finds best days given multiple opportunities" do
        expect(stock_picker([2,11,1,4,10,2])).to eq([2,4])
    end

    it "doesn't buy in a downtrend" do
        expect(stock_picker([5,4,3,2,1])).to eq(nil)
    end
end
