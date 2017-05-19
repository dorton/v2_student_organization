class UsersController < ApplicationController
  def show
    @city = City.find(params[:city_id])
    @user = @city.users.find(params[:id])
  end

  def new
    @city = City.find(params[:city_id])
    @user = @city.users.new

  end

  def edit
    @city = City.find(params[:city_id])
    @user = @city.users.find(params[:id])
  end

  def update
    @city = City.find(params[:city_id])
    @user = @city.users.find(params[:id])

    if @user.update(user_params)
      redirect_to city_path(@city.id)
    else
      redirect_to edit_city_user_path(@city.id, @user.id)
    end
  end

  def create
    @city = City.find(params[:city_id])
    @user = @city.users.new(user_params)

    if @user.save!
      redirect_to city_path(@city.id)
    else
      redirect_to new_city_user_path(@city.id)
    end
  end

  def destroy
    @city = City.find(params[:city_id])

    @city.users.find(params[:id]).destroy

    redirect_to city_path(@city.id)
  end



  private

    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :password)
    end
end
