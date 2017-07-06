require 'test_helper'

class FantasyTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::Fantasy::VERSION
  end
end
