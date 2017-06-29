class MoviesController < ApplicationController
  

  
  def index
    @movies = Movie.where("title LIKE ?", "#{params[:start]}%").order(id: :desc)
  end
  
  def new
    @movie = Movie.new
  end
  
  def create
  	@movie = Movie.create(
  	    params.require(:movie).permit(:title, :genre, :year_released, :info_url))  
  	    
  	    # @movie = Movie.create(
  	    #   title: params[:movie][:title]
  	    #   genre: params[:movie][:genre]
  	    #   year_released: params[:movie][:year_released]
  	    #   info_url: params[:movie][:info_ur)
  end
  
  def show
    @movie = Movie.find(params[:id])
  end

  def edit
    @movie = Movie.find(params[:id])
  end
  
  def update
	  @movie = Movie.find(params[:id])  
    @movie.update_attributes(params.require(:movie).permit(:title, :genre, :year_released, :info_url))
    flash[:success] = "Movie successfully updated"
    redirect_to "/movies/#{@movie.id}"
  end
  
  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy
    flash[:danger] = "Movie successfully deleted"
    redirect_to movies_path
  end
end

