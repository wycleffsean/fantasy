module ApplicativeTest
  def self.included(klass)
    klass.include(ApplyTest)
  end

  def test_applicative_identity
    klass = @target.class
    assert_equal(
      @target,
      @target.ap(klass.of(&Fantasy.identity))
    )
  end

  def test_applicative_homomorphism
    klass = @target.class
    assert_equal(
      klass.of(Fantasy.identity[@target]),
      klass.of(@target).ap(klass.of(&Fantasy.identity))
    )
  end

  def test_applicative_interchange
    klass = @target.class
    target = klass.of { 1 }
    assert_equal(
      target.ap(klass.of {|f| f[Fantasy.identity] }),
      klass.of(&Fantasy.identity).ap(target)
    )
  end
end
