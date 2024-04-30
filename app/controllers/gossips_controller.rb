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
      flash[:success] = 'Gossip créé avec succès !'
      redirect_to gossips_path
    else
      flash[:error] = "Erreur lors de la création du Gossip : #{@gossip.errors.full_messages.join(", ")}"
      render :new
    end
  end

  private

  def gossip_params
    params.require(:gossip).permit(:user_id, :title, :description)
  end
end