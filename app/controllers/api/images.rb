# coding: utf-8

Helianthus::App.controllers :api_images do
  post :upload, map: '/api/images/upload', csrf_protection: false do
    return {
      result: true,
      message: 'blank image'
    } if params[:image].blank?

    File.open('/home/tett23/Dropbox/tmp/'+Digest::SHA1.hexdigest(Time.now.to_i.to_s+rand().to_s)+'.jpg', 'wb') do |f|
      f.print(Glitch.glitch(params[:image][:tempfile].read))
    end

    {result: true}.to_json
  end


  private
  def filename()
  end
end
