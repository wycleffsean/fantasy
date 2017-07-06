module ChainTest
  def self.included(klass)
    klass.include(ApplyTest)
  end

  def test_chain_associativity
    klass = @target.class

    f = ->(val) { klass.new(val * 2) }
    g = ->(val) { klass.new(val + 5) }

    assert_equal(
      @target.chain{|x| f[x].chain(&g) },
      @target.chain(&f).chain(&g)
    )
  end

  def test_chain_guards_return_type
    assert_raises(TypeError) do
      @target.chain{ Object.new }
    end
  end
end
