def range(start, en)
    return [] if en < start
    return [start] if (en - 1) == start
  
    [start] + range(start + 1, en)
end

def recursion_sum(n)
    return n if n <= 1

    n + recursion_sum(n - 1)
end

def iterative_sum(n)
    sum = 0 

    (1..n).each do |i|
        sum += i 
    end
    sum 
end

def exponentiation(b, n)
    return 1 if n == 0

    b * exponentiation(b, n - 1)
end

def exponentiation2(b, n)
    return 1 if n == 0
    return b if n == 1

    if n.even? 
        exponentiation2(b, n / 2) * exponentiation2(b, n / 2)
    else
        b * (exponentiation2(b, (n - 1) / 2) * (exponentiation2(b, (n - 1) / 2)))
    end

end

def deep_dup(array)
    dup_array = []

    array.each do |ele|
        if ele.is_a?(Array)
            dup_array << deep_dup(ele)
        else
            dup_array << ele
        end
    end

    dup_array
end

def fibonacci(n)
    return [0] if n == 0
    return [0, 1] if n == 1
    return [0, 1, 1] if n == 2

    fibs = fibonacci(n-1)[-1] + fibonacci(n-2)[-1]
    fibonacci(n-1) << fibs
end

def fibonacci2(n)
    if n == 0
        return [0]
    elsif n == 1
        return [0, 1]
    elsif n == 2
        return [0, 1, 1]
    end

    sequence = [0, 1, 1]
    i = 2
    while sequence.length < n+1
        last = sequence.last
        before_last = sequence[-2]
        nex = last + before_last
        sequence << nex
        i += 1
    end

    sequence
end
# require "byebug"
def bsearch(array, target)
    # debugger
    middle = array.length / 2       #index = 2
    lower_half = array[0...middle]      #  [1,]  
    upper_half = array[middle + 1.. -1] # [] 

    return nil if array[middle] != target && array.length <= 1
    return middle if array[middle] == target && array.length <= 1


    if array[middle] == target 
        middle 
    elsif array[middle] > target 
        bsearch(lower_half, target)
    else
        result = bsearch(upper_half, target)
        return nil if result == nil 
        middle + 1 + result
    end

end



  
def merge_sort(array)
    return array if array.length <=1 

    middle = array.length / 2       
    lower_half = array[0...middle]       
    upper_half = array[middle.. -1]

    merge(merge_sort(lower_half), merge_sort(upper_half))

end

def merge(array1, array2)
    merged_array = []
    until array1.empty? || array2.empty?
        if array1[0] > array2[0] 
            merged_array << (array2.shift)
        elsif
            array1[0] < array2[0]
            merged_array << (array1.shift)
        else
            merged_array.push(array1.shift, array2.shift)
        end
    end
    # if array1.empty?

    merged_array + array1 + array2
end

# [38,27,43,3,9,82,10]



def subsets(array)
    return [[]] if array.length == 0

    all_subsets = []
    prev_subs = subsets(array[0..-2]) # [[]]

    prev_subs.each do |subs|
        all_subsets << subs + [array[-1]] 
    end

    prev_subs + all_subsets 
end

#missing: [1, 3], [2, 3], [1, 2, 3]
# [1, 3] => [array.first, array.last]
#[2, 3] =>  [array[-2], array[-1]]
#[1, 2, 3] => array


def permutations(array)
    
end