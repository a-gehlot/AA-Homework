require "rspec"
require "test.rb"


$count = 0
RSpec.describe "let" do
  subject { $count += 1 }

  # count will not change no matter how many times we reference it in this it block
  it "memoizes the value" do
    expect(subject).to eq(1) # evaluated (set to 1)
    expect(subject).to eq(1) # did not change (still 1)
  end

  # count will be set to 2 and remain 2 untill the end of the block
  it "is not cached across examples" do
    expect(subject).to eq(2) # evaluated in new it block
  end
end