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
    end
end
