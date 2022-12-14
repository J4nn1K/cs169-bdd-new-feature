class MoviesController < ApplicationController

  def show
    id = params[:id] # retrieve movie ID from URI route
    @movie = Movie.find(id) # look up movie by unique ID
    # will render app/views/movies/show.<extension> by default
  end

  def index
    @movies = Movie.all
  end

  def new
    # default: render 'new' template
  end

  def create
    @movie = Movie.create!(movie_params)
    flash[:notice] = "#{@movie.title} was successfully created."
    redirect_to movies_path
  end

  def edit
    @movie = Movie.find params[:id]
  end

  def update
    @movie = Movie.find params[:id]
    @movie.update_attributes!(movie_params)
    flash[:notice] = "#{@movie.title} was successfully updated."
    redirect_to movie_path(@movie)
  end

  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy
    flash[:notice] = "Movie '#{@movie.title}' deleted."
    redirect_to movies_path
  end

  #### Part 2 ####
  # Write your show_by_director method here
  def show_by_director
    # Your code here 
    @movie = Movie.find(params[:id])
    @director = @movie.director
    if @movie.others_by_same_director.length == 0
      flash[:warning] = "'#{@movie.title}' has no director info"
      redirect_to movies_path
    end
  end

  private

  #### Part 1 ####
  # You may need to modify other private methods.
  def movie_params
    params.require(:movie).permit(:title, :director, :rating, :description, :release_date)
  end
end
