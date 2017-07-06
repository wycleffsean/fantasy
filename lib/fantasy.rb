require "fantasy/version"
require "fantasy/id"

module Fantasy
  def self.identity
    ->(val) { val }
  end
end
