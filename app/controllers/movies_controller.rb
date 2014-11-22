class MoviesController < ApplicationController
  before_action :set_movie, only: [:show, :edit, :update, :destroy]
  # respond_to :html

  def index
    @movies = Movie.all
  end

  def show
  end

  def new
    @movie = Movie.new
  end

  def edit
  end

  def create
    @movie = Movie.new(movie_params)
    respond_to do |format|
      if @movie.save
        format.html { riderict_to @movie, notice: 'Movie was successfuly created.' }
        format.json {render action: 'show', status: :created, location: @movie }     
      else
        format.html {render action: 'new' }
        format.json {render json: @movie.errors, status: :unprocessable_entity}
      end
    end
  end


  def update
    respond_to do |format|
      if @movie.update(movie_params)
        format.html { redirect_to @movie, notice: 'Movie was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @movies.errors, status: :unprocessable_entity }
      end
    end
  end
 


  def destroy
    @movie.destroy
    respond_to do |format|
      format.html { redirect_to movies_url}
      format.json { head :no_content}
    end
  end

  private
    def set_movie
      @movie = Movie.find(params[:id])
    end

    def movie_params
      params.require(:movie).permit(:title, :release_year, :price, :description, :director, :stock, :poster)
    end
end

