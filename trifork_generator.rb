require './plf_generator'

class TriforkGenerator
  attr_accessor :r1, :r2, :r3, :s1, :s2, :s3, :word_length, :d , :n

  def initialize(n=Time.now.to_i.to_s, r1=3, r2=7, r3=8, s1=1, s2=1, s3=3, d=2, word_length=3)
    @r1 = r1
    @r2 = r2
    @r3 = r3
    @s1 = s2
    @s2 = s2
    @s3 = s3
    @word_length = word_length
    @d = 2
    @n = n[(n.length - @word_length)..-1].to_i
  end

  def generate
    plf1 = PlfGenerator.new(@n.to_s, @r1, @s1, @d, @word_length).generate
    plf2 = PlfGenerator.new(@n.to_s, @r2, @s2, @d, @word_length).generate
    plf3 = PlfGenerator.new(@n.to_s, @r3, @s3, @d, @word_length).generate

    shifted_plf1 = plf1 >> @d
    shifted_plf2 = plf2 >> @d
    shifted_plf3 = plf3 >> @d

    trifork1 = plf1 ^ shifted_plf2
    trifork2 = plf2 ^ shifted_plf1
    trifork3 = plf3 ^ shifted_plf2

    result = trifork1 ^ trifork3
    puts result
  end
end