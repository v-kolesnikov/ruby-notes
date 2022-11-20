# https://ruby-doc.org/core-3.1.2/Kernel.html#binding-method

class Foo
  def initialize
    @a = :Foo
  end

  def context
    binding
  end
end

class Bar
  def initialize
    @a = :Bar
  end

  def context
    binding
  end
end

def eval_context(context)
  eval(<<~RUBY, context)
    puts @a
  RUBY
end

eval_context(Foo.new.context)
# => Foo
eval_context(Bar.new.context)
# => Bar
