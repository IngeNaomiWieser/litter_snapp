class UsersController < ApplicationController

  def show
  end

  def new
    @user = User.new
    # @address = Address.new
  end

  def create
    @user = User.new user_params
    @user.address = Address.new user_params['address_attributes']
    if @user.save
      session[:user_id] = @user.id
      redirect_to home_path, notice: "Logged in!"
    else
      render :new
    end
  end

  def edit
    @user = User.find params[:id]
  end
  

  def update
  end

  def destroy
  end

  private

  def user_params
    params.require(:user).permit(
      :first_name,
      :last_name,
      :email,
      :password,
      :password_confirmation,
      address_attributes: [
        :postal_code,
        :province,
        :country
      ]
    )
  end
end
