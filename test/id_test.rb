require 'test_helper'

class IdTest < Minitest::Test
  include FunctorTest
  include ApplicativeTest

  def setup
    @target = Fantasy::Id.new(1)
  end
end
