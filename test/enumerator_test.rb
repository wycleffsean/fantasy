require 'test_helper'

class EnumeratorTest < Minitest::Test
  include MonadTest

  def setup
    @target = Fantasy::Enumerator.new([1])
  end
end
