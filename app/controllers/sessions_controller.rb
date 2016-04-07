class SessionsController < ApplicationController
  before_action :disallow_user, :only => [:new, :create]
  before_action :require_user, :only => [:destroy]

  def new
    @user = User.new
  end

  def create
    if @user = User.find_by_email(params[:session][:email]).try(:authenticate, params[:session][:password])
      session[:user_id] = @user.id
      flash[:success] = "Hello, #{@user.username}."
      redirect_to :users
    else
      flash[:warning] = "Incorrect email or password."
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:success] = "Logged out successfully."
    redirect_to :users
  end
end
