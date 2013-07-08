# coding: utf-8

class Image
  STORE_DIRECTORY = File.expand_path(PADRINO_ROOT+'/public/images')
  include DataMapper::Resource

  property :id, Serial
  property :path, String
  property :original_filename, String
  property :created_at, DateTime

  belongs_to :device, required: false

  before :save do
    ext = File.extname(self.original_filename)
    self.path = Digest::SHA1.hexdigest(Time.now.to_i.to_s+rand().to_s)+ext
  end

  def self.list
    all()
  end

  def glitch
    glitch_chars = ('a'..'z').to_a
    split_image(1000).map do |bytes|
      bytes.gsub!(glitch_chars.sample, glitch_chars.sample) if rand(10).zero?
      bytes.gsub!('9', '1') if rand(10).zero?

      bytes
    end
  end

  def outpath
    STORE_DIRECTORY+'/'+path
  end

  def public_path
    "/images/#{self.path}"
  end

  private
  def split_image(count)
    file = open(self.outpath, 'rb').read

    file.split(//).each_slice(count).map {|a| a.join}
  end
end
