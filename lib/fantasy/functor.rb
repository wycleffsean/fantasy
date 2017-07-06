module Fantasy
  module Functor
    def map
      self.class.new yield(value)
    end
  end
end
