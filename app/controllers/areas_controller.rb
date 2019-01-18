class AreasController < AppController
  before_action :set_area, only: [:show]

  def show
    add_breadcrumb "#{@area.name}", area_path(@area)
    @rooms = @area.rooms
  end

  private
      # Use callbacks to share common setup or constraints between actions.
      def set_area
        @area = Area.find(params[:id])
      end
end
