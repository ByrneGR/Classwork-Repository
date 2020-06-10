gem 'rspec'
require 'practice_test'

describe "#jumble_sort" do
  before(:each) do 
    expect_any_instance_of(Array).not_to receive(:sort)
    expect_any_instance_of(Array).not_to receive(:sort!)
    expect_any_instance_of(Array).not_to receive(:sort_by!)
  end

  it "defaults to alphabetical order" do
    expect(jumble_sort("hello")).to eq("ehllo")
  end

  it "takes an alphabet array and sorts by that order" do
    alph = ("a".."z").to_a
    hello = "hello".chars.uniq
    alph -= hello
    alphabet = (hello += alph)

    expect(jumble_sort("hello", alphabet)).to eq("hello")
  end

  it "sorts by a reversed alphabet" do
    reverse = ("a".."z").to_a.reverse
    expect(jumble_sort("hello", reverse)).to eq("ollhe")
  end

  it "works with an empty string" do
    expect(jumble_sort("")).to eq("")
  end

  it "works with a string of one item" do
    expect(jumble_sort("g")).to eq("g")
  end
end

describe "Array#my_quick_sort" do
  let(:array) { [1, 2, 3, 4, 5, 6, 7].shuffle }
  let(:sorted) { [1, 2, 3, 4, 5, 6, 7] }

  before(:each) do
    expect_any_instance_of(Array).not_to receive(:sort)
    expect_any_instance_of(Array).not_to receive(:sort!)
    expect_any_instance_of(Array).not_to receive(:sort_by!)
  end

  it "works with an empty array" do 
    expect([].my_quick_sort).to eq([])
  end

  it "works with an array of one number" do 
    expect([5].my_quick_sort).to eq([5])
  end

  it "sorts numbers" do
    expect(array.my_quick_sort).to eq(sorted)
  end

  it "sorts arrays with duplicates" do
    expect([17,10,10,9,3,3,2].my_quick_sort).to eq([2,3,3,9,10,10,17])
  end

  it "will use block if given" do
    reversed = array.my_quick_sort do |num1, num2|
      num2 <=> num1
    end
    expect(reversed).to eq([7, 6, 5, 4, 3, 2, 1])
  end
end

describe "Array#bubble_sort" do
  let(:array) { [1, 2, 3, 4, 5].shuffle }

  before(:each) do
    expect_any_instance_of(Array).not_to receive(:sort)
    expect_any_instance_of(Array).not_to receive(:sort!)
    expect_any_instance_of(Array).not_to receive(:sort_by!)
  end

  it "works with an empty array" do
    expect([].bubble_sort).to eq([])
  end

  it "works with an array of one item" do
    expect([1].bubble_sort).to eq([1])
  end

  it "sorts numbers" do
    expect(array.bubble_sort).to eq([1, 2, 3, 4, 5])
  end

  it "will use block if given" do
    sorted = array.bubble_sort do |num1, num2|
      # order numbers based on descending sort of their squares
      num2**2 <=> num1**2
    end

    expect(sorted).to eq([5, 4, 3, 2, 1])
  end

  it "does not modify original" do
    duped_array = array.dup
    duped_array.bubble_sort
    expect(duped_array).to eq(array)
  end
end

describe 'Array#my_bsearch' do
  # create a method that performs a binary search in an array for
  # an element and returns its index
  let(:arr) { [11, 22, 33, 44, 66] }

  disallowed_methods = [
    :index, :find_index, :include?, :member?, :dup
  ]

  before(:each) do
    disallowed_methods.each do |method|
      expect(arr).not_to receive(method)
    end
    expect_any_instance_of(Array).not_to receive(:index)
  end

  it "returns nil if the array is empty" do
    expect([].my_bsearch(11)).to be_nil
  end

  it "returns the index of a target" do
    expect(arr.my_bsearch(33)).to eq(2)
  end

  it "returns the index of a target that's less than the midpoint" do
    expect(arr.my_bsearch(22)).to eq(1)
  end

  it "returns the index of a target that's greater than the midpoint" do
    expect(arr.my_bsearch(66)).to eq(4)
  end

  it "returns nil if the target isn't found" do
    # Properly returns nil searching left half
    expect(arr.my_bsearch(5)).to be_nil
    # Properly returns nil searching right half
    expect(arr.my_bsearch(80)).to be_nil
  end
end

describe "Array#merge_sort" do
  let(:array) { [1, 2, 3, 4, 5].shuffle }

  it "works with an empty array" do
    expect([].merge_sort).to eq([])
  end

  it "works with an array of one item" do
    expect([1].merge_sort).to eq([1])
  end

  before(:each) do
    expect_any_instance_of(Array).not_to receive(:sort)
    expect_any_instance_of(Array).not_to receive(:sort!)
    expect_any_instance_of(Array).not_to receive(:sort_by!)
  end

  it "sorts numbers" do
    expect(array.merge_sort).to eq([1,2,3,4,5])
  end

  it "will use block if given" do
    reversed = array.merge_sort do |num1, num2|
      # reverse order
      num2 <=> num1
    end
    expect(reversed).to eq([5, 4, 3, 2, 1])
  end

  it "does not modify original" do
    duped_array = array.dup
    duped_array.merge_sort
    expect(duped_array).to eq(array)
  end

  it "calls the merge helper method" do
    expect(Array).to receive(:merge).at_least(:once).and_call_original
    array.merge_sort
  end
end

