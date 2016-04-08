class ShipsController < ApplicationController
  before_action :require_user, except: [:index]

  def index
    if current_user
      @user = current_user
    else
      #link to marketing landing page partial view
    end
  end

  def show
  end

  def new
    @ship = Ship.new
  end

  def create
    @ship = current_user.ships.create(ship_params)

    respond_to do |format|
      if @ship.save
        format.html { redirect_to user_ships_path, notice: 'ship was successfully created.' }
      else
        format.html { render :new }
      end
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
