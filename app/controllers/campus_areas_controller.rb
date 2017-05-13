class CampusAreasController < ApplicationController


  def new
    @city = current_user.city
    @campus_area = @city.campus_areas.new
  end

  def edit
    @city = current_user.city
    @campus_area = @city.campus_areas.find(params[:id])
  end

  def create
    @city = current_user.city

    @campus_area = @city.campus_areas.new(campus_area_params)

    if @campus_area.save!
      redirect_to cities_path
    else
      redirect_to cities_path
    end
  end

  def update
    @city = current_user.city
    @campus_area = @city.campus_areas.find(params[:id])

    if @campus_area.update(campus_area_params)
      redirect_to cities_path
    else
      redirect_to cities_path
    end
  end

  def destroy
    @city = current_user.city

    @city.campus_areas.find(params[:id]).destroy
    redirect_to cities_path, notice: "Demoed!"
  end

  private

  def set_campus_area
    @city = current_user.city
  end
  def campus_area_params
    params.require(:campus_area).permit(:name)
  end
end
