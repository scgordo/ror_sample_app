class ActorsController < ApplicationController
  
  def index
    @actors = Actor.all.order(id: :desc)
  end
  
  def new
    @actor = Actor.new
  end
  
  def create
  	@movie = Actor.create(
  	    params.require(:actor).permit(:name, :gender, :zodiac)) 
  end
  
  def edit
    @actor = Actor.find(params[:id])
  end
  
  def show
    @actor = Actor.find(params[:id])
  end
  
  def update
    @actor = Actor.find(params[:id])
    @actor.update_attributes(params.require(:actor).permit(:name, :gender, :zodiac))
    flash[:success] = "Actor successfully updated"
    redirect_to "/actors/#{@actor.id}"
  end
  
  def destroy
    @actor = Actor.find(params[:id])
    @actor.destroy
    flash[:success] = "Actor successfully deleted"
    redirect_to actors_path
  end
end
