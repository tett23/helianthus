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
    @device = Device.new
    @attribute = DeviceAttribute.new

    render :'devices/new'
  end

  post :create do
    device = params[:device].symbolize_keys
    device.delete(:attribute)
    attribute = params[:device][:attribute].symbolize_keys
    attribute.delete(:id)
    @device = Device.new(device)
    @attribute = DeviceAttribute.new(attribute)

    if @device.save && @attribute.save
      Device.get(@device.uuid).update(attribute: @attribute)

      flash[:success] = "UUID「#{@device.name}」を作成しました"
      redirect url(:devices, :show, uuid: @device.uuid)
    else
      flash[:error] = "UUID「#{@device.name}」の作成に失敗しました"
      render 'devices/new'
    end
  end

  get :edit, with: :uuid do |uuid|
    @device = Device.first(uuid: uuid)
    @attribute = DeviceAttribute.get(@device.attribute_id)

    render :'devices/edit'
  end

  put :update do
    device = params[:device].symbolize_keys
    device.delete(:attribute)
    attribute = params[:device][:attribute].symbolize_keys
    @device = Device.first(uuid: device[:uuid])
    @attribute = DeviceAttribute.get(@device.attribute_id)

    if @device.update(device) && @attribute.update(attribute)
      flash[:success] = "UUID「#{@device.name}」を編集しました"
      redirect url(:devices, :show, uuid: @device.uuid)
    else
      flash[:error] = "UUID「#{@device.name}」の編集に失敗しました"
      render 'devices/edit'
    end
  end
end
