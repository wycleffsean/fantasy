require "fantasy/version"
require "fantasy/id"
require "fantasy/enumerator"

module Fantasy
  def self.identity
    ->(val) { val }
  end
end
