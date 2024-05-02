class GossipsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  before_action :set_gossip, only: [:show, :edit, :update, :destroy]
  before_action :authorize_user!, only: [:edit, :update, :destroy]
  
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
    @gossip = current_user.gossips.build(gossip_params)
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

  def like
    @gossip = Gossip.find(params[:id]) # Assurez-vous que @gossip est correctement initialisé
    @gossip.likes.create(user_id: current_user.id) if @gossip # Vérifiez que @gossip n'est pas nil
    redirect_to gossip_path(@gossip), notice: 'Gossip liké avec succès !'
  end

  def unlike
    @gossip = Gossip.find(params[:id]) # Assurez-vous que @gossip est correctement initialisé
    like = @gossip.likes.find_by(user_id: current_user.id)
    like.destroy if like
    redirect_to gossip_path(@gossip), notice: 'Gossip unliké avec succès !'
  end

  private

  def set_gossip
    @gossip = Gossip.includes(user: :city).find(params[:id])
  end

  def authorize_user!
    unless @gossip.user == current_user
      flash[:error] = "Vous n'êtes pas autorisé à effectuer cette action."
      redirect_to gossip_path(@gossip)
    end
  end

  def gossip_params
    params.require(:gossip).permit(:title, :description)
  end
end
