require 'bundler'
Bundler.require

require 'benchmark'

#GC.disable

class YajlEncoder
  def initialize
    @io = StringIO.new
    @enc = Yajl::Encoder.new
  end

  def encode(row)
    @enc.encode(row, @io)
  end
end

class OjEncoder
  def initialize
    @io = StringIO.new
  end

  def encode(row)
    @io << Oj.dump(row)
  end
end

def random_str
  (0...20).map { ('a'..'z').to_a[rand(26)] }.join 
end

def row
  [random_str, random_str, random_str, random_str]
end

yajl = YajlEncoder.new
oj = OjEncoder.new
n = ARGV[0]&.to_i || 10_000_000


Benchmark.bmbm do |x|
  r = row
  x.report("Yajl") do
    n.times do
      yajl.encode(r)
    end
  end
  x.report("Oj") do
    n.times do
      oj.encode(r)
    end
  end
end
