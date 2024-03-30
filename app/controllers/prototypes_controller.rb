class PrototypesController < ApplicationController
  before_action :set_prototype,except: [:index, :new, :create]
  before_action :authenticate_user!, except: [:index, :show]

  
  

  def index
    @prototypes = Prototype.includes(:user)
  end

  def new
    @prototype= Prototype.new
  end

  def show
    @comment = Comment.new
    @comments = @prototype.comments
  end

  def edit
    @prototype=Prototype.find(params[:id])
    unless current_user == @prototype.user
      redirect_to root_path, alert: "他のユーザーのプロトタイプを編集することはできません。"
    end
  end

  def update
    @prototype=Prototype.find(params[:id])
    if @prototype.update(prototype_params)
    redirect_to prototype_path(@prototype)
    else
      render :edit
    end   
  end
  
  def destroy
    @prototype=Prototype.find(params[:id])
    @prototype.destroy
    redirect_to root_path
  end

  def create
    @prototype=Prototype.new(prototype_params)
    if @prototype.save
      redirect_to root_path
    else
      render :new
    end
  end

  private
  def prototype_params
    params.require(:prototype).permit(:concept,:catch_copy,:title,:image,).merge(user_id: current_user.id)
  end

  def set_prototype
    @prototype = Prototype.find(params[:id])
  end

end
