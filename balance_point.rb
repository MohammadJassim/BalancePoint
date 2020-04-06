def BalancePoint(input)

	@balance_point = -1
	sum_previous_elements = 0
	sum_following_elements = 0
	index=0
	x = 0
	y = 0
	@sum_of_previous_slices = 0
	@sum = input.inject(0){|sum,index| sum + index}
    	half_sum = @sum/2
    
	split_point = input.length/2
	@sliced_input = input.each_slice(2).to_a	
	
	split_arr = split_array(input, split_point)
	array_one = split_arr[0]
	array_two = split_arr[1]
	
	sumA = add_array_items(array_one)
	sumB = add_array_items(array_two)	

	if sumA == sumB
		balance_point = array_one.last
	else
		balance_point = find_index_of_balance_point(array_one, array_two)
	end

	for index in 0...@sliced_input.length	    
	    if sum_previous_elements == 0
	        sum_previous_elements = @sliced_input[index].inject(0){|sum,x| sum+x}
	    else
	        if sum_previous_elements > half_sum && index <= split_point
	            balance_point = index
	        end
	        sum_previous_elements += @sliced_input[index][x]
	        x+=1
	    end    
        if sum_following_elements == 0
	        sum_following_elements = @sliced_input[split_point/2].inject(0){|sum,x| sum+x}
	    else
	        sum_following_elements += @sliced_input[split_point/2+1][y]
	        y+=1
	    end
	    
	    if sum_previous_elements == sum_following_elements
	        balance_point = @sliced_input.find_index(index)
	    end
	end	    
	return balance_point     
end


def split_array(input, split_length)
  	@sliced_input = input.each_slice(split_length).to_a
end

def add_array_items(theArray, index)
    sum_previous_elements = theArray.inject(0){|sum,x| sum+x}
end

def compare_array_sums(theArray, array_one_sum, array_two_sum, max)
    if array_one_sum >= array_two_sum
        return true
    else
        return false
    end
end

def find_index_of_balance_point(array_one, max)
    sum=0
    balance_point = -1
    
    for index in 0..array_one.length
        sum += array_one[index]
        if sum == max
            return index + 1
        end
    end
    return balance_point
end