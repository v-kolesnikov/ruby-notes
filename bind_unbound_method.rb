# https://ruby-doc.org/core-3.1.2/UnboundMethod.html#bind-method

class Foo
  def initialize
    @a = :Foo
  end
  
  def foo
    @a
  end
end

class Bar < Foo
  def initialize
    @a = :Bar
  end
end

umeth = Foo.instance_method(:foo)
puts umeth.bind(Foo.new).call
# => Foo
puts umeth.bind_call(Foo.new)
# => Foo
puts umeth.bind(Bar.new).call
# => Bar
puts umeth.bind_call(Bar.new)
# => Bar
