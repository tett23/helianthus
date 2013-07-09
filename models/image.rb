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
    open(self.outpath,'rb').read.to_glitch
  end

  def outpath
    STORE_DIRECTORY+'/'+path
  end

  def public_path
    "/images/#{self.path}"
  end
end
