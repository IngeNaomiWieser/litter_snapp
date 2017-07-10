class LittersController < ApplicationController
  before_action :authenticate_user!, except: [:show]

  def new
    @litter = Litter.new
  end

  def create
    @litter = Litter.new litter_params
    @litter.user = current_user
    if @litter.save
      redirect_to litter_path(@litter), notice: 'Thanks, you just mapped some litter!'
    else
      render :new
    end
  end


  def show
    @litter = Litter.find params[:id]
  end

  private

  def litter_params
    params.require(:litter).permit(
      :amount,
      :cleaned,
      :image
    )
  end

end
