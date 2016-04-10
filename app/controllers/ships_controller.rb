class ShipsController < ApplicationController
  before_action :require_user, except: [:index]

  def index
    if current_user
      @user = current_user
      @ship = Ship.new
      @ships = Ship.timeline(@user).page(params[:page]).per(100)
    else
      #link to marketing landing page partial view
    end
  end

  def show
  end

  def new
      @ship = current_user.ships.new
  end

  def create
    @ship = current_user.ships.new(ship_params)
    if @ship.save
      flash[:success] = "Your ship has sailed!"
      redirect_to user_path(id: current_user.id)
    else
      flash[:warning] = "Your ship can't set sail like that."
    end
  end

  def destroy
    @ship.destroy
    respond_to do |format|
      format.html { redirect_to user_ships_path, notice: 'Ship was successfully destroyed.' }
    end
  end

  private

  def ship_params
    params.require(:ship).permit(:body)
  end

end
