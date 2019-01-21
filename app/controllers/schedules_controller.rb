class SchedulesController < AppController
  before_action :set_schedule, only: [:show, :edit, :update, :destroy]

  add_breadcrumb "Schedule", :schedules_path

  # GET /schedules
  # GET /schedules.json
  def index
    @schedules = Schedule.all
    add_breadcrumb "Overview", schedules_path
  end

  # GET /schedules/1
  # GET /schedules/1.json
  def show
    add_breadcrumb "#{@schedule.device.name}", schedule_path(@schedule)
  end

  # GET /schedules/new
  def new
    @schedule = Schedule.new
    @devices = Device.includes(:room).all
    add_breadcrumb "New", new_schedule_path
  end

  # GET /schedules/1/edit
  def edit
    @devices = Device.includes(:room).all
    add_breadcrumb "Edit", edit_schedule_path(@schedule)
  end

  # POST /schedules
  # POST /schedules.json
  def create
    @schedule = Schedule.new(schedule_params)

    respond_to do |format|
      if @schedule.save
        format.html { redirect_to @schedule, notice: 'Schedule was successfully created.' }
        format.json { render :show, status: :created, location: @schedule }
      else
        format.html { render :new }
        format.json { render json: @schedule.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /schedules/1
  # PATCH/PUT /schedules/1.json
  def update
    respond_to do |format|
      if @schedule.update(schedule_params)
        format.html { redirect_to @schedule, notice: 'Schedule was successfully updated.' }
        format.json { render :show, status: :ok, location: @schedule }
      else
        format.html { render :edit }
        format.json { render json: @schedule.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /schedules/1
  # DELETE /schedules/1.json
  def destroy
    @schedule.destroy
    respond_to do |format|
      format.html { redirect_to schedules_url, notice: 'Schedule was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_schedule
      @schedule = Schedule.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def schedule_params
      params.require(:schedule).permit(:start_date, :start_time, :end_date, :end_time, :frequency, :device_id, :inversed)
    end
end
