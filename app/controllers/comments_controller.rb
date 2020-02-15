class CommentsController < ApplicationController

  def create
    #user_anonymous = User.find_by(first_name:"anonymous")
    @gossip = Gossip.find(params['gossip_id'])
    @comment = @gossip.comments.create(content: params['comment'], user_id: current_user.id)
    if @comment.save
      flash[:success] = "Le Commentaire a bien été créé !"
      redirect_to gossip_path(@gossip.id)
    else
      flash[:danger] = "Le Commentaire n'a pas été créé !"
      render gossip_path(@gossip.id)
    end
  end

  def edit
    @gossip= Gossip.find(params['gossip_id'])
    @comment = Comment.find(params['id'])
  end

  def update
    @gossip = Gossip.find(params['gossip_id'])
    @comment = Comment.find(params['id'])
    if @comment.update(content: params['content'])
      redirect_to gossip_path(@gossip.id)
      flash[:success] = "Le Commentaire a bien été édité !"
    else
      render gossip_path(@gossip.id)
      flash[:danger] = "Le Commentaire n'a pas été édité !"
    end
  end

  def destroy
    @gossip = Gossip.find(params['gossip_id'])
    @comment = Comment.find(params['id'])
    if @comment.destroy
      redirect_to gossip_path(@gossip.id)
      flash[:success] = "Le Commentaire a bien été supprimé !"
    else
      render gossip_path(@gossip.id)
      flash[:danger] = "Le Commentaire n'a pas été supprimé !"
    end
  end
end