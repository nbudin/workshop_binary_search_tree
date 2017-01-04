require 'bst'

describe BST do
  let(:bst) { BST.new }

  it 'should insert one value' do
    bst.insert(5)

    bst.root.value.must_equal 5
  end

  it 'should return the values in order' do
    [5, 3, 9].each do |value|
      bst.insert(value)
    end

    bst.values.must_equal [3, 5, 9]
  end

  it 'should correctly build a random tree' do
    values = []

    25.times do |i|
      n = Random.rand(100)
      values << n
      bst.insert(n)
    end

    bst.values.must_equal values.sort
  end

  it 'should calculate the height' do
    [8, 3, 1, 6, 4, 7].each do |value|
      bst.insert(value)
    end

    bst.height.must_equal 4
  end

  it 'should calculate the diameter' do
    [8, 3, 1, 6, 4, 7, 10, 14, 13].each do |value|
      bst.insert(value)
    end

    bst.diameter.must_equal 7
  end

  it 'should calculate the min' do
    [8, 3, 1, 6, 4, 7, 10, 14, 13].each do |value|
      bst.insert(value)
    end

    bst.min.must_equal 1
  end

  it 'should calculate the max' do
    [8, 3, 1, 6, 4, 7, 10, 14, 13].each do |value|
      bst.insert(value)
    end

    bst.max.must_equal 14
  end

  it 'should delete values' do
    [8, 3, 1, 6, 4, 7, 10, 14, 13].each do |value|
      bst.insert(value)
    end

    bst.delete(3)
    bst.values.must_equal [1, 4, 6, 7, 8, 10, 13, 14]
  end

  it 'should delete the root' do
    [8, 3, 1, 6, 4, 7, 10, 14, 13].each do |value|
      bst.insert(value)
    end

    bst.delete(8)
    bst.values.must_equal [1, 3, 4, 6, 7, 10, 13, 14]
  end
end