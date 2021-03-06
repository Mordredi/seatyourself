class UsersController < ApplicationController

  before_filter :user_owner, :only => [:create, :edit, :destroy, :update, :show]
  
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to login_url
    else
      render 'new'
    end
  end

  def show
    @user = User.find(params[:id])

    @restaurants = @user.restaurants
    @reservations = @user.reservations
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      redirect_to user_url(@user)
    else
      render 'edit'
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to root_url
  end

  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :about, :avatar_url)
  end

end
