gem 'rspec'
require 'practice_test'

describe "Array#my_flatten" do
  let(:arr) { [1, 2, 3, [4, [5, 6]], [[[7]], 8]] }
  
  before(:each) do
    expect(arr).not_to receive(:flatten)
    expect(arr).not_to receive(:flatten!)
  end

  it 'flattens arrays correctly' do
    expect(arr.my_flatten).to eq([1, 2, 3, 4, 5, 6, 7, 8])
  end

  it 'works on one dimensional arrays' do
    expect([1,2,3,4,5].my_flatten).to eq([1,2,3,4,5])
  end
end

describe "Array#my_controlled_flatten" do
  let(:arr) { [1,[2,3], [4,[5]], [[6,[7]]]] }
  
  before(:each) do
    expect(arr).not_to receive(:flatten)
    expect(arr).not_to receive(:flatten!)
  end

  it "flattens an array the specified number of levels" do
    expect(arr.my_controlled_flatten(1)).to eq([1,2,3,4,[5], [6, [7]]])
  end

  it "returns a one dimensional array when invoked without an argument" do
    expect(arr.my_controlled_flatten).to eq([1, 2, 3, 4, 5, 6, 7])
  end

  it "works on one dimensional arrays" do
    expect([1,2,3,4,5].my_controlled_flatten).to eq([1,2,3,4,5])
  end
end

describe "Hash#my_merge" do
  let(:hash1) { {a: 1, b: 2, c: 3} }
  let(:hash2) { {d: 4, e: 5} }
  let(:hash3) { {c: 33, d: 4, e: 5} }

  before(:each) do
    expect(hash1).not_to receive(:merge)
    expect(hash1).not_to receive(:merge!)
  end

  it "merges 2 hashes and returns a hash" do
    expect(hash1.my_merge(hash2)).to eq({ a: 1, b: 2, c: 3, d: 4, e: 5 })
  end

  it "prioritizes values from the hash being merged in" do
    expect(hash1.my_merge(hash3)).to eq({ a: 1, b: 2, c: 33, d: 4, e: 5 })
  end
end

describe "#primes" do
  it "returns first five primes in order" do
    expect(primes(5)).to eq([2, 3, 5, 7, 11])
  end

  it "returns an empty array when asked for zero primes" do
    expect(primes(0)).to eq([])
  end
end

describe "Array#my_zip" do
  let(:arr1) { [ 4, 5, 6 ] }
  let(:arr2) { [ 7, 8, 9 ] }

  before(:each) do
    expect_any_instance_of(Array).not_to receive(:zip)
  end 

  it "Zips arrays of the same size" do
    expect([1, 2, 3].my_zip(arr1, arr2)).to eq([[1, 4, 7], [2, 5, 8], [3, 6, 9]])
  end

  it "Zips arrays of differnet sizes and adds nil appropriately" do
    expect(arr1.my_zip([1,2], [8])).to eq([[4, 1, 8], [5, 2, nil], [6, nil, nil]])
  end

  let(:arr3) { [10, 11, 12] }
  let(:arr4) { [13, 14, 15] }

  it "Zips arrays with more elements than the original" do
    expect([1, 2].my_zip(arr1, arr2, arr3, arr4)).to eq([[1, 4, 7, 10, 13], [2, 5, 8, 11, 14]])
    expect([].my_zip(arr1, arr2, arr3, arr4)).to eq([])
  end
end

describe "Array#median" do
  let(:even_array) { [3, 2, 6, 7] }
  let(:odd_array) { [3, 2, 6, 7, 1] }

  it "returns nil for the empty array" do
    expect([].median).to be_nil
  end

  it "returns the element for an array of length 1" do
    expect([1].median).to eq(1)
  end

  it "returns the median of an odd-length array" do
    expect(odd_array.median).to eq(3)
  end

  it "returns the median of an even-length array" do
    expect(even_array.median).to eq(4.5)
  end
end

describe "Array#my_rotate" do
  let(:arr) {[ "a", "b", "c", "d" ]}

  before (:each) do
    expect_any_instance_of(Array).not_to receive(:rotate)
    expect_any_instance_of(Array).not_to receive(:rotate!)
  end
  
  it "Rotates the elements 1 position if no argument is passed in" do
    expect(arr.my_rotate).to eq(["b", "c", "d", "a"])
  end
  
  it "Rotates the elements correctly if an argument is passed in" do
    expect(arr.my_rotate(2)).to eq(["c", "d", "a", "b"])
  end

  it "Rotates the elements correctly if a negative argument is passed in" do
    expect(arr.my_rotate(-3)).to eq(["b", "c", "d", "a"])
  end

  it "Rotates the elements correctly for a large argument" do
    expect(arr.my_rotate(15)).to eq(["d", "a", "b", "c"])
  end
end

describe "Array#dups" do
  it "solves a simple example" do
    expect([1, 3, 0, 1].dups).to eq({ 1 => [0, 3] })
  end

  it "finds two dups" do
    expect([1, 3, 0, 3, 1].dups).to eq({ 1 => [0, 4], 3 => [1, 3] })
  end

  it "finds multi-dups" do
    expect([1, 3, 4, 3, 0, 3].dups).to eq({ 3 => [1, 3, 5] })
  end

  it "returns {} when no dups found" do
    expect([1, 3, 4, 5].dups).to eq({})
  end
end

describe "Array#my_join" do
  let(:array) { [ "a", "b", "c", "d" ] }

  before(:each) do
    expect_any_instance_of(Array).not_to receive(:join)
  end

  it "joins an array if no argument is passed" do
    expect(array.my_join).to eq("abcd")
  end

  it "joins an array if an argument is passed" do
    expect(array.my_join("$")).to eq("a$b$c$d")
  end
end

describe "Array#my_reverse" do
  let(:array) { [ "a", "b", "c", "d" ] }

  before(:each) do
    expect_any_instance_of(Array).not_to receive(:reverse!)
    expect(array).not_to receive(:reverse)
    expect(array).not_to receive(:dup)
    expect(array).not_to receive(:slice)
    expect(array).not_to receive(:slice!)
  end

  it "reverses an array" do
    expect(array.my_reverse).to eq(["d", "c", "b", "a"])
  end

  it "works on an array of length one" do 
    expect([1].my_reverse).to eq([1])
  end

  it "works on an empty array" do 
    expect([].my_reverse).to eq([])
  end
end

describe "Array#two_sum" do
  it "returns positions of pairs of numbers that add to zero" do
    expect([5, 1, -7, -5].two_sum).to eq([[0, 3]])
  end

  it "finds multiple pairs" do
    expect([5, -1, -5, 1].two_sum).to eq([[0, 2], [1, 3]])
  end

  it "finds pairs with same element" do
    expect([5, -5, -5].two_sum).to eq([[0, 1], [0, 2]])
  end

  it "returns [] when no pair is found" do
    expect([5, 5, 3, 1].two_sum).to eq([])
  end

  it "won't find spurious zero pairs" do
    expect([0, 1, 2, 3].two_sum).to eq([])
  end

  it "will find real zero pairs" do
    expect([0, 1, 2, 0].two_sum).to eq([[0, 3]])
  end
end

describe "#factors" do
  it "returns the factors of 10 in order" do
    expect(factors(10)).to eq([1, 2, 5, 10])
  end

  it "returns just two factors for primes" do
    expect(factors(13)).to eq([1, 13])
  end

  it "returns nil for numbers less than zero" do
    expect(factors(-5)).to eq(nil)
  end

  it "returns [1] when finding factors of 1" do
    expect(factors(1)).to eq([1])
  end
end

describe "#doubler" do
  subject(:array) { [1, 2, 3] }

  it "doubles the elements of the array" do
    expect(doubler(array)).to eq([2, 4, 6])
  end

  it "does not modify the original array" do
    duped_array = array.dup
    doubler(array)
    
    expect(array).to eq(duped_array)
  end
end

