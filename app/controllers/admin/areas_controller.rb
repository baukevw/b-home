module Admin
  class AreasController < AdminController
    before_action :set_area, only: [:show, :edit, :update, :destroy]

    add_breadcrumb "Areas", :admin_areas_path

    # GET /areas
    # GET /areas.json
    def index
      @areas = Area.all

      add_breadcrumb "Overview", admin_areas_path
    end

    # GET /areas/1
    # GET /areas/1.json
    def show
      add_breadcrumb "#{@area.name}", admin_area_path(@area)
    end

    # GET /areas/new
    def new
      @area = Area.new
      add_breadcrumb "New area", new_admin_area_path
    end

    # GET /areas/1/edit
    def edit
      add_breadcrumb "Edit area", edit_admin_area_path(@area)
    end

    # POST /areas
    # POST /areas.json
    def create
      @area = Area.new(area_params)

      respond_to do |format|
        if @area.save
          format.html { redirect_to @area, notice: 'Area was successfully created.' }
          format.json { render :show, status: :created, location: @area }
        else
          format.html { render :new }
          format.json { render json: @area.errors, status: :unprocessable_entity }
        end
      end
    end

    # PATCH/PUT /areas/1
    # PATCH/PUT /areas/1.json
    def update
      respond_to do |format|
        if @area.update(area_params)
          format.html { redirect_to @area, notice: 'Area was successfully updated.' }
          format.json { render :show, status: :ok, location: @area }
        else
          format.html { render :edit }
          format.json { render json: @area.errors, status: :unprocessable_entity }
        end
      end
    end

    # DELETE /areas/1
    # DELETE /areas/1.json
    def destroy
      @area.destroy
      respond_to do |format|
        format.html { redirect_to areas_url, notice: 'Area was successfully destroyed.' }
        format.json { head :no_content }
      end
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_area
        @area = Area.find(params[:id])
      end

      # Never trust parameters from the scary internet, only allow the white list through.
      def area_params
        params.require(:area).permit(:name, :icon)
      end
  end
end
