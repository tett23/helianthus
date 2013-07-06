# coding: utf-8

class Device
  include DataMapper::Resource

  property :id, Serial
  property :uuid, String, unique: true
  property :name, String

  belongs_to :attribute, 'DeviceAttribute', required: false

  def self.list
    self.all
  end
end
