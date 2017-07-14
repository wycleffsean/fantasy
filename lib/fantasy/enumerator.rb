require 'forwardable'

module Fantasy
  class Enumerator
    extend Forwardable

    def_delegators :@enum, :map, :flat_map
    alias_method :chain, :flat_map

    def initialize(obj)
      if obj.kind_of? Enumerator
        @enum = obj
      else
        @enum = obj.to_enum
      end
    end
=begin
    # applicative
    def self.of(x = nil, &block)
      if block_given?
        new block
      else
        new x
      end
    end

    # functor
    def map
      self.class.new yield(value)
    end

    # apply
    def ap(fa)
      raise(
        ArgumentError,
        'must be same kind of %s'.freeze % self.class
      ) unless fa.is_a? self.class
      raise(
        ArgumentError,
        'value of Apply must be callable'.freeze
      ) unless fa.value.respond_to?(:call)
      self.class.new fa.value[value]
    end

    # chain
    def chain
      result = yield value
      raise(
        TypeError,
        'block must return kind of %s'.freeze % self.class
      ) unless result.is_a? self.class
      result
    end
=end
  end
end
