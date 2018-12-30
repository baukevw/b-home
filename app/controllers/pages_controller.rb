class PagesController < AppController
  def index
  end

  def dashboard
    @areas = Area.all
  end
end
