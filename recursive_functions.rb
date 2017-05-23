#1,1,2,3,5,8,13,21...
#1,2,3,4,5,6,7, 8...

def fibs(n)
  starter = [1,1]
  if n <= 2
    return starter[0..n-1]
  else
    (0..n-3).each do |idx|
      starter.push(starter[idx]+starter[idx+1])
    end
  end
  return starter
end

def fibs_rec(n)
  return [1] if n ==1
  return [1,1] if n == 2
  return fibs_rec(n-1).push(fibs_rec(n-1)[n-3]+fibs_rec(n-1)[n-2])
end


=begin
merge helper function
Compares 2 inputs to see if they are sorted.
Returns true if item1 comes before item2
=end
def input_compare(item1, item2)

  if item1.class == Fixnum || item2.class == Fixnum
    if item1.to_s < item2.to_s
      return true
    else
      return false
    end
  else
    if item1.length == 0 || item1.to_s[0] < item2.to_s[0]
      return true
    elsif item2.length == 0 || item1.to_s[0] > item2.to_s[0]
      return false
    else
      return input_compare(item1[1..-1],item2[1..-1])
    end
  end
end


=begin
merge_sort helper function
Merge two sorted lists.
Returns a new sorted list containing those elements that are in
either list1 or list2.
=end
def merge(list1, list2)

    working_list1 = list1.clone
    working_list2 = list2.clone
    new_list = []
    while working_list1 != [] and working_list2 != []
      if input_compare(working_list1[0],working_list2[0]) == true
        item_to_add = working_list1.shift
      else
        item_to_add = working_list2.shift
      end
      new_list.push(item_to_add)
    end
    if working_list1 == []
      working_list2.each {|item| new_list.push(item)}
    elsif working_list2 == []
      working_list1.each {|item| new_list.push(item)}
    end

    return new_list
  end



def merge_sort(list1)

  if list1.length == 0
    return []
  elsif list1.length == 1
    return list1
  elsif list1.length == 2
    return merge([list1[0]],[list1[1]])
  else
    new_list1 = merge([list1[0]],[list1[1]])
    new_list2 = merge_sort(list1[2..-1])
    return merge(new_list1,new_list2)
  end
end
