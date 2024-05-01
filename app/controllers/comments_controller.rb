class CommentsController < ApplicationController
    def create
      @gossip = Gossip.find(params[:gossip_id])
      @comment = @gossip.comments.build(comment_params)
      @comment.user = current_user # Assigne l'utilisateur actuel comme l'auteur du commentaire
  
      if @comment.save
        flash[:success] = "Commentaire ajouté avec succès !"
      else
        flash[:error] = "Erreur lors de l'ajout du commentaire : #{comment.errors.full_messages.join(", ")}"
      end
      redirect_to gossip_path(@gossip)
    end
  
    private
  
    def comment_params
      params.require(:comment).permit(:content)
    end
  end