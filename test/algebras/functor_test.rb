module FunctorTest
  def test_functor_identity
    assert_equal @target, @target.map(&Fantasy.identity)
  end

  def test_functor_composition
    f = ->(val) { 2 * val }
    g = ->(val) { 1 + val }
    assert_equal @target.map(&g).map(&f), @target.map {|x| f[g[x]] } 
  end

  def test_functor_map_receives_a_block
    assert_raises do
      @target.map
    end
  end

  def test_functor_map_returns_value_of_same_functor
    assert_equal @target.class, @target.map(&Fantasy.identity).class
  end
end
