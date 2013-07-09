module Glitch

  def glitch
    @glitch_characters = ('a'..'z').to_a
    @bytes = self.dup.force_encoding('ascii-8bit')
    bytes = split_bytes(3).map do |b|
      b.gsub!(@glitch_characters.sample, @glitch_characters.sample) if rand(10).zero?

      b
    end.join()

    bytes.split(//).reverse.map do |b|
      b.gsub(@glitch_characters.sample, @glitch_characters.sample) if rand(@bytes.size/10).zero?

      b
    end.reverse.join()
  end

  private
  def split_bytes(count)
    @bytes.split(//).each_slice(count).map {|a| a.join}
  end
end

class String
  include Glitch
end
