# coding: utf-8

class DeviceAttribute
  include DataMapper::Resource

  property :id, Serial
  property :head, String
  property :is_debug, Boolean, default: false
  property :is_auto_upgrade, Boolean, default: true
  property :repos, String
  property :model_name, String

  belongs_to :device, required: false
end
