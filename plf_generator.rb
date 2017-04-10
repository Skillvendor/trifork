require 'fibonacci'

class PlfGenerator
  attr_accessor :r, :s, :word_length, :d , :n

  def initialize(n=Time.now.to_i.to_s, r=3, s=1, d=2, word_length=3)
    @r = r
    @s = s
    @word_length = word_length
    @d = d
    @m = 2 ** word_length
    @n = n[(n.length - @word_length)..-1].to_i
  end

  def generate
    fib = Fibonacci.new
    return (fib.fast_val(@n-@r) + fib.fast_val(@n-@s)) % @m
  end
end