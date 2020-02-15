class GossipsController < ApplicationController

  skip_before_action :only_signed_in, only: [:index, :show]
  before_action :is_author?, only: [:edit, :update, :destroy]

  def index
    @gossips = Gossip.all
  end

  def show
    @gossip = Gossip.find(params['id'])
    @comment = Comment.new
    @comments = @gossip.comments 
  end

  def new
    @gossip = Gossip.new
  end

  def create
   # user_anonymous = User.find_by(first_name:"anonymous")
    @gossip = Gossip.create(title: params['title'], content: params['content'], user_id: current_user.id)
    if @gossip.save
      redirect_to "/"
      flash[:success] = "Le Gossip a bien été créé !"
    else
      render :new
      flash[:danger] = "Le Gossip n'a pas été créé !"
    end
  end

  def edit
    @gossip = Gossip.find(params['id'])
  end

  def update
    @gossip = Gossip.find(params['id'])
    if @gossip.update(title: params['title'], content: params['content'])
      redirect_to gossip_path(@gossip.id)
      flash[:success] = "Le Gossip a bien été édité !"
    else
      render edit_gossip_path(@gossip.id)
      flash[:danger] = "Le Gossip n'a pas été édité !"
    end
  end

  def destroy
    @gossip = Gossip.find(params['id'])
    if @gossip.destroy
      redirect_to "/"
      flash[:success] = "Le Gossip a bien été supprimé !"
    else
      render gossip_path(@gossip.id)
      flash[:danger] = "Le Gossip n'a pas été supprimé !"
    end
  end
end
