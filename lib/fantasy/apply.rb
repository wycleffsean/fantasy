module Fantasy
  module Apply
    def ap
      self.class.new yield(value)
    end
  end
end
