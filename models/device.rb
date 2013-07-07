# coding: utf-8

class Device
  include DataMapper::Resource

  property :uuid, UUID, key: true, default: (proc do
    UUIDTools::UUID.random_create.to_s
  end)
  property :name, String

  belongs_to :attribute, 'DeviceAttribute', required: false

  def self.list
    self.all
  end
end
