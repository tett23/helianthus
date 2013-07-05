# coding: utf-8

Helianthus::App.controllers :devices do
  get :index do
    @devices = Device.list()

    render :'devices/index'
  end

  get :show, with: :uuid do |uuid|
    @device = Device.first(uuid: uuid)

    render :'devices/show'
  end

  get :new do
    render :'devices/new'
  end

  post :create do
    @device = Device.new(params[:device])

    if @device.save
      flash[:success] = "UUID「#{@device.name}」を作成しました"
      redirect url(:devices, :show, uuid: @device.uuid)
    else
      flash[:error] = "UUID「#{@device.name}」の作成に失敗しました"
      render 'devices/new'
    end
  end

  get :edit, with: :uuid do |uuid|
    @device = Device.first(uuid: uuid)

    render :'devices/edit'
  end

  put :update do

  end
end
