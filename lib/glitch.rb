#require 'math'

module Glitch
  extend self

  def glitch(bytestream)
    bytestream.force_encoding('ascii-8bit').gsub('9', '1')
  end
end
