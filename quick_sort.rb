class QuickSort
	attr_accessor :arr
	def initialize(arr)
		@arr=arr
	end

	def quick_sort(start_index,end_index)
		if start_index<end_index
			m = partition(start_index,end_index)
			quick_sort(start_index,m-1)
			quick_sort(m+1,end_index)
		end		
	end

	def partition(start_index,end_index)
		pivot = @arr[end_index]
		pIndex = start_index
		for i in start_index..end_index-1
			if @arr[i]<=pivot
				swap(i,pIndex)
				pIndex=pIndex+1
			end
		end
		swap(pIndex,end_index)				
		return pIndex
	end

	def swap(index1,index2)
		temp = @arr[index1]
		@arr[index1] = @arr[index2]
		@arr[index2] = temp			
	end	
end