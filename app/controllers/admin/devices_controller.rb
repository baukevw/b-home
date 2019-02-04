module Admin
  class DevicesController < AdminController
    before_action :set_device, only: [:show, :edit, :update, :destroy]

    add_breadcrumb "Devices", :admin_devices_path

    # GET /devices
    # GET /devices.json
    def index
      @devices = Device.includes(room: :area).all
      add_breadcrumb "Overview", admin_devices_path
    end

    # GET /devices/1
    # GET /devices/1.json
    def show
      add_breadcrumb "#{@device.name}", admin_device_path(@device)
    end

    # GET /devices/new
    def new
      @device = Device.new
      @rooms = Room.area_ordered
      add_breadcrumb "New device", new_admin_device_path
    end

    # GET /devices/1/edit
    def edit
      @rooms = Room.area_ordered
      add_breadcrumb "Edit device", edit_admin_device_path(@device)
    end

    # POST /devices
    # POST /devices.json
    def create
      @device = Device.new(device_params)

      respond_to do |format|
        if @device.save
          format.html { redirect_to admin_device_path(@device), notice: 'Device was successfully created.' }
          format.json { render :show, status: :created }
        else
          format.html { render :new }
          format.json { render json: @device.errors, status: :unprocessable_entity }
        end
      end
    end

    # PATCH/PUT /devices/1
    # PATCH/PUT /devices/1.json
    def update
      respond_to do |format|
        if @device.update(device_params)
          format.html { redirect_to admin_device_path(@device), notice: 'Device was successfully updated.' }
          format.json { render :show, status: :ok }
        else
          format.html { render :edit }
          format.json { render json: @device.errors, status: :unprocessable_entity }
        end
      end
    end

    # DELETE /devices/1
    # DELETE /devices/1.json
    def destroy
      @device.destroy
      respond_to do |format|
        format.html { redirect_to admin_devices_url, notice: 'Device was successfully destroyed.' }
        format.json { head :no_content }
      end
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_device
        @device = Device.find(params[:id])
      end

      # Never trust parameters from the scary internet, only allow the white list through.
      def device_params
        params.require(:device).permit(:name, :icon, :device_type, :current_state, :mqtt_topic, :mqtt_state_topic, :room_id, data: {})
      end
  end
end
