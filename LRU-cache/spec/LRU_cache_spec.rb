require 'rspec'
require 'LRU_cache'

describe LRUCache do
    subject { LRUCache.new(5) }
    describe "#initialize" do
        it "should create an empty cache" do
            expect(subject.cache).to be_a(Array)
            expect(subject.count).to eq(0)
        end
    end
end
