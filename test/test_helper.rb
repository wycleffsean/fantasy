$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'fantasy'

Dir['./test/algebras/*.rb'].each do |file|
  require file
end

require 'minitest/autorun'
