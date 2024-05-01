class GossipsController < ApplicationController
  def index
    @gossips = Gossip.all
  end

  def show
    @gossip = Gossip.includes(user: :city).find(params[:id])
  end

  def new
    @gossip = Gossip.new
  end

  def create
    @gossip = Gossip.new(gossip_params)
    if @gossip.save
      flash[:success] = 'Gossip créé avec succès !'
      redirect_to gossip_path(@gossip)
    else
      flash[:error] = "Erreur lors de la création du Gossip : #{gossip.errors.full_messages.join(", ")}"
      render :new
    end
  end

  def edit
    @gossip = Gossip.find(params[:id])
  end

  def update
    @gossip = Gossip.find(params[:id])
    if @gossip.update(gossip_params)
      flash[:success] = 'Gossip mis à jour !'
      redirect_to gossip_path(@gossip)
    else
      flash[:error] = "Erreur lors de la mise à jour du Gossip : #{gossip.errors.full_messages.join(", ")}"
      render :edit
    end
  end

  def destroy
    @gossip = Gossip.find(params[:id])
    @gossip.destroy
    flash[:success] = 'Gossip supprimé avec succès !'
    redirect_to "/gossips/"
  end

  private

  def gossip_params
    params.require(:gossip).permit(:user_id, :title, :description)
  end
end