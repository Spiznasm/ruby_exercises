def bubble_sort(arr)

  sorted = false
  iteration_length = arr.length - 1
  while sorted == false
    sorted = true
    (0..iteration_length).each do |index|
    if index == iteration_length
      iteration_length -= 1
    elsif arr[index] <= arr[index+1]
      nil
    else
      item = arr[index]
      arr[index]=arr[index + 1]
      arr[index+1]=item
      sorted = false
    end
    end
  end
return arr
end

def bubble_sort_by(arr)
  #accepts a block that defines what is a proper order.
  #The block should have a negative return value if the items are in correct order.
  sorted = false
  iteration_length = arr.length - 1
  while sorted == false
    sorted = true
    (0..iteration_length).each do |index|
    if index == iteration_length
      iteration_length -= 1
    elsif yield(arr[index],arr[index+1]) < 0
      nil
    else
      item = arr[index]
      arr[index]=arr[index + 1]
      arr[index+1]=item
      sorted = false
    end
    end
  end
return arr
end
