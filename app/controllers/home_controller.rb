class HomeController < ApplicationController
  #def index
  #  @restaurants = Restaurant.search(nil)
  #end
  #def search
  #  @restaurants= Restaurant.search(params[:q])
  #  render "index"
  #end
  def index
    @restaurants = Restaurant.paginate(page: params[:page])
  end
  def search
    @restaurants= Restaurant.search(params[:q]).paginate(page: params[:page])
    render "index"
  end
end