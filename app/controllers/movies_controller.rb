class MoviesController < ApplicationController
  before_action :set_movie, only: [:show, :edit, :update, :destroy]
  respond_to :html

  def index
    @movies = Movie.all
    respond_with(@movies)
  end

  def show
    respond_with(@movie)
  end

  def new
    @movie = Movie.new
    respond_with(@movie)
  end

  def edit
  end

  def create
    @movie = Movie.new(movie_params)
    if @movie.save
      flash[:notice] = "Movie successfully created" 
      respond_with(@movie)     
    else
      render action: "new"
    end
  end


  def update
    if @movie.update(movie_params)
      flash[:notice] = "Movie successfully updated"
      respond_with(@movie)
    else
      render action: "edit"
    end
  end

  def destroy
    @movie.destroy
    respond_with(@movie)
  end

  private
    def set_movie
      @movie = Movie.find(params[:id])
    end

    def movie_params
      params.require(:movie).permit(:title, :release_year, :price, :description, :director)
    end
end
