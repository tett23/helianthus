# coding: utf-8

Helianthus::App.controllers :api_images do
  post :upload, map: '/api/images/upload', csrf_protection: false do
    return {
      result: true,
      image_id: nil,
      message: 'blank image'
    } if params[:image].blank?

    image = Image.create(
      original_filename: params[:image][:filename]
    )
    open(image.outpath, 'wb').print(params[:image][:tempfile].read)

    {result: true, image_id: image.id}.to_json
  end
end
