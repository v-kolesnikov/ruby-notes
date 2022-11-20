# https://www.ruby-lang.org/en/documentation/faq/8/
#
# 1. There are class variables
# 2. Class variables are not thread-safe

# TODO:
#
#   - Thread safety

# Class variables
class Foo
  @@instances = 0

  def initialize
    @@instances += 1
  end

  def self.instances
    @@instances
  end
end

Array.new(10).map { |i| Foo.new }
puts Foo.instances

# Class instance variables
class Bar
  @instances = 0

  class << self
    attr_accessor :instances
  end

  def initialize
    self.class.instances += 1
  end

  def self.total
    @@instances
  end
end

Array.new(10).map { |i| Bar.new }
puts Bar.instances
