class MovieItemsController < ApplicationController
  before_action :set_movie_item, only: [:show, :edit, :update, :destroy]
  respond_to :html

  def index
    @movie_items = MovieItem.all
    respond_with(@movie_items)
  end

  def show
    respond_with(@movie_item)
  end

  def new
    @movie_item = MovieItem.new
    respond_with(@movie_item)
  end

  def edit
  end

  def create
    @movie_item = MovieItem.new(movie_item_params)
    @movie_item.save
    respond_with(@movie_item)
  end

  def update
    @movie_item.update(movie_item_params)
    respond_with(@movie_item)
  end

  def destroy
    @movie_item.destroy
    respond_with(@movie_item)
  end

  private
    def set_movie_item
      @movie_item = MovieItem.find(params[:id])
    end

    def movie_item_params
      params.require(:movie_item).permit(:movie_id, :cart_id, :quantity)
    end
end
