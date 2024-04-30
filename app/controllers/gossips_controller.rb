class GossipsController < ApplicationController
  def show
    @gossip = Gossip.find(params[:id])
  end

  def index
    if params[:user_id]
      @user = User.find(params[:user_id])
      @gossips = @user.gossips
    else
      @gossips = Gossip.all
    end
  end

  def new
    @gossip = Gossip.new
  end

  def create
    @gossip = Gossip.new(gossip_params)
    if @gossip.save
      redirect_to gossips_path, notice: "Gossip successfully created!"
    else
      render :new
    end
  end

  private

  def gossip_params
    params.require(:gossip).permit(:user_id, :title, :description)
  end
end