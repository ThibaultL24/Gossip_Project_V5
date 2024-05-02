class CommentsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :edit, :update, :destroy]
  skip_before_action :verify_authenticity_token, only: [:create]

  def create
    @gossip = Gossip.find(params[:gossip_id])
    @comment = @gossip.comments.build(comment_params)
    @comment.user = current_user
    if @comment.save
      flash[:success] = 'Commentaire ajouté avec succès !'
      redirect_to gossip_path(@gossip)
    else
      flash[:error] = "Erreur lors de la création du commentaire : #{ @comment.errors.full_messages.join(", ") }"
      render 'gossips/show'
    end
  end  
  
  def edit
    @gossip = Gossip.find(params[:gossip_id])
    @comment = @gossip.comments.find(params[:id])
  end

  def update
    @gossip = Gossip.find(params[:gossip_id])
    @comment = @gossip.comments.find(params[:id])

    if @comment.update(comment_params)
      redirect_to gossip_path(@gossip), flash: { success: 'Commentaire mis à jour avec succès !' }
    else
      flash.now[:error] = "Erreur lors de la mise à jour du commentaire : #{comment.errors.full_messages.join(", ")}"
      render :edit
    end
  end

  def destroy
    @gossip = Gossip.find(params[:gossip_id])
    @comment = @gossip.comments.find(params[:id])
    @comment.destroy
    redirect_to gossip_path(@gossip), flash: { success: 'Commentaire supprimé avec succès !' }
  end

  private

  def require_login
    unless current_user
      flash[:error] = "Vous devez être connecté pour effectuer cette action."
      redirect_to login_path
    end
  end

  def comment_params
    params.require(:comment).permit(:content)
  end
end
