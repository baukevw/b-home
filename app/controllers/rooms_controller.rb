class RoomsController < AppController
  before_action :set_room, only: [:show, :edit, :update, :destroy]

  add_breadcrumb "Rooms", :rooms_path

  # GET /rooms
  # GET /rooms.json
  def index
    @rooms = Room.includes(:area).all
    add_breadcrumb "Overview", rooms_path
  end

  # GET /rooms/1
  # GET /rooms/1.json
  def show
    add_breadcrumb "#{@room.name}", room_path(@room)
  end

  # GET /rooms/new
  def new
    @room = Room.new
    @areas = Area.all
    add_breadcrumb "New room", new_room_path
  end

  # GET /rooms/1/edit
  def edit
    @areas = Area.all
    add_breadcrumb "Edit room", edit_room_path(@room)
  end

  # POST /rooms
  # POST /rooms.json
  def create
    @room = Room.new(room_params)

    respond_to do |format|
      if @room.save
        format.html { redirect_to @room, notice: 'Room was successfully created.' }
        format.json { render :show, status: :created, location: @room }
      else
        format.html { render :new }
        format.json { render json: @room.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /rooms/1
  # PATCH/PUT /rooms/1.json
  def update
    respond_to do |format|
      if @room.update(room_params)
        format.html { redirect_to @room, notice: 'Room was successfully updated.' }
        format.json { render :show, status: :ok, location: @room }
      else
        format.html { render :edit }
        format.json { render json: @room.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rooms/1
  # DELETE /rooms/1.json
  def destroy
    @room.destroy
    respond_to do |format|
      format.html { redirect_to rooms_url, notice: 'Room was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_room
      @room = Room.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def room_params
      params.require(:room).permit(:name, :icon, :area_id)
    end
end
