module MonadTest
  def self.included(klass)
    klass.include(ApplicativeTest)
    klass.include(ChainTest)
  end

  def test_monad_left_identity
    klass = @target.class
    f = ->(x) { klass.new(x + 1) }
    a = 10

    assert_equal(
      f[a],
      klass.of(a).chain(&f)
    )
  end

  def test_monad_right_identity
    klass = @target.class
    assert_equal(
      @target,
      @target.chain(&klass.method(:of))
    )
  end
end
