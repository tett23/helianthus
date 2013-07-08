# coding: utf-8

Helianthus::App.controllers :images do
  get :index do
    @images = Image.list()

    render :'images/index'
  end

  get :show, with: :id, provides: [:html, :jpg] do
    @image = Image.get(params[:id])

    p content_type
    case content_type
    when :html
      render :'images/show'
    when :jpg
      if params[:glitch]
        @image.glitch
      else
        open(@image.outpath, 'rb').read
      end
    end
  end
end
