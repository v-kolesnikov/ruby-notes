# https://ruby-doc.org/core-3.1.2/Object.html#extend-method
# https://ruby-doc.org/core-3.1.2/Module.html#include-method
# https://ruby-doc.org/core-3.1.2/Module.html#prepend-method

module Extension
  def foo
    puts "#foo from extension"
  end
end

module Inclusion
  def foo
    puts "#foo from inclusion"
  end
end

module Prepending
  def foo
    puts "#foo from prepending"
    super
  end
end

class Foo
  extend Extension
  prepend Prepending
  include Inclusion

  def foo
    puts "#foo from instance itself"
    super
  end
end

Foo.foo
# => #foo from extension
Foo.new.foo
# => #foo from prepending
# => #foo from instance itself
# => #foo from inclusion
