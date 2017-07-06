module ApplyTest
  def self.included(klass)
    klass.include(FunctorTest)
  end

  def test_apply_composition
    f = ->(val) { 2 * val }
    g = ->(val) { 1 + val }

    a = @target.class.new(g)
    u = @target.class.new(f)

    assert_equal(
      @target.ap(u).ap(a),
      @target.ap(u.ap(a.map{|f| ->(g){ ->(x) { f[g[x]] } } }))
    )
  end

  def test_apply_ap_argument_must_be_of_same_kind
    assert_raises(ArgumentError) do
      @target.ap(Object.new)
    end
  end

  def test_apply_ap_argument_must_wrap_callable
    assert_raises(ArgumentError) do
      @target.ap(@target.class.new(1))
    end
  end
end
