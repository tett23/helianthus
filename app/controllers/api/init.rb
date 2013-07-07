# coding: utf-8

Helianthus::App.controllers :api_init do
  post :init, map: '/api/init', csrf_protection: false do
    device = Device.create()
    Device.get(device.uuid).update(attribute: DeviceAttribute.create())

    {result: true, uuid: device.uuid}.to_json
  end
end
