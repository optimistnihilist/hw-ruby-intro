# When done, submit this entire file to the autograder.

# Part 1

def sum(array)
  # Returns the sum of the array
  # &:to_i returns a block version of the to_i function
  # reduce, as the name implies, reduces the Integer array into a single number
  array.map(&:to_i).reduce(0, :+)
end

def max_2_sum(arr)
  # Returns the sum of the two largest numbers of the array
  # map(&:to_i) attempts to convert everything in the array into an Integer object
  # max(2) takes the two largest numbers, whereas reduce reduces them both into
  # a single number, using addition
  arr.map(&:to_i).max(2).reduce(0, :+)
end

def sum_to_n? arr, n
  # Returns true if any two elements of arr is equal to n
  # Not too crazy about the algorithm though...
  0.upto(arr.size - 1) do |first|
    0.upto(arr.size - 1) do |second|
      unless first == second
        return true if (arr[first] + arr[second] == n)
      end
    end
  end
  false
end

# Part 2

def hello(name)
  "Hello, #{name}"
end

def starts_with_consonant? s
  # (For our purposes, a consonant is any letter other than A, E, I, O, U._
 unless s.empty? or s.nil?
    return true unless s[0].downcase =~ Regexp.new('[aeiou]') or !(s[0].downcase).between?('a', 'z')
 end
  false
end

def binary_multiple_of_4? s
  unless s.between?('a', 'z') or s.nil? or s.empty?
    return true if s.to_i(2) % 4 == 0
  end
  false
end

# Part 3

class BookInStock
  def initialize(isbn, price)
    check_isbn(isbn)
    check_price(price)
    @isbn = isbn
    @price = price
  end
  
  def isbn
    return @isbn
  end
  
  def price
    return @price
  end
  
  def isbn=(new_isbn)
    check_isbn(new_isbn)
    @isbn = new_isbn
  end
  
  def price=(new_price)
    check_price(new_price)
    @price = new_price
  end
  
  def price_as_string
    return format("$%.2f", @price)
  end
  
  private
  def check_isbn(input)
    raise ArgumentError if input.nil? or input.empty?
  end
  
  def check_price(input)
    raise ArgumentError if input <= 0
  end
end
