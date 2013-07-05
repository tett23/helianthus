# coding: utf-8

class Device
  include DataMapper::Resource

  property :id, Serial
  property :uuid, String, unique: true
  property :name, String

  def self.list
    self.all
  end
end
