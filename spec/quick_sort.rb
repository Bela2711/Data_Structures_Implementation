require './quick_sort'
describe QuickSort do
  it "is a basic test case" do
    arr = [5,8,4,1,3,2]
    obj = QuickSort.new(arr)
    obj.quick_sort(0,arr.length-1)
    expect(obj.arr[0]).to eql(1)
    expect(obj.arr[arr.size-1]).to eql(8)
  end
end