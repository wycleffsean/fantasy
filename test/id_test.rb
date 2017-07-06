require 'test_helper'

class IdTest < Minitest::Test
  include MonadTest

  def setup
    @target = Fantasy::Id.new(1)
  end
end
