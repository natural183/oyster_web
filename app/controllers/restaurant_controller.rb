class RestaurantController < ApplicationController
  def search
    @restaurants= Restaurant.search(params[:q])
    render "index"
  end
    def index
    @restaurants = Restaurant.paginate(page: params[:page])
  end
end
