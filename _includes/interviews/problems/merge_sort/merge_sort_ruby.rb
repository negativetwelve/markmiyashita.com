# Merge Sort Ruby Solution
# By: Mark Miyashita

def merge_sort(lst)
  if lst.length <= 1
    lst
  end
  mid = (lst.length / 2).floor
  left = merge_sort(lst[0..mid - 1])
  right = merge_sort(lst[mid..lst.length])
  merge(left, right)
end

def merge(left, right)
  if left.nil?
    right
  elsif right.nil?
    left
  elsif left[0] < right[0]
    [left[0]] + merge(left[1..left.length], right)
  else
    [right[0]] + merge(left, right[1..right.length])
  end
end

puts merge_sort([1, 5, 4, 3, 2, 65])
puts merge([1, 5, 6], [3, 6, 9])
