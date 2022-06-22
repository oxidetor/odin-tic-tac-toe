def bubble_sort(arr)
    (arr.length-1).times do
        swap_count = 0
        arr.each_with_index do |elem, idx|
            break if idx+1 == arr.length
            if elem > arr[idx+1] 
                temp = arr[idx]
                arr[idx] = arr[idx+1]
                arr[idx+1] = temp
                swap_count += 1
            end
        end
        break if swap_count == 0
    end
    arr
end

p bubble_sort([4,3,78,2,0,2])