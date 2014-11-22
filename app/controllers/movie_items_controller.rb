class MovieItemsController < ApplicationController
  before_action :set_movie_item, only: [:show, :edit, :update, :destroy]
  before_action :current_cart, only: [:create]


  def index
    @movie_item = MovieItem.all
  end

  def show
  end

  def new
    @movie_item = MovieItem.new
  end

  def edit
  end

  def create
    @movie_item = @cart.movie_items.find_or_initialize_by_movie_id(movie_id: params[:movie_id],:quantity=>0 )
    @movie_item.quantity += 1
    respond_to do |format|
      if @movie_item.save
        format.html { redirect_to @movie_item.cart, notice: "#{@movie_item.movie.title} was successfully added to cart." }
        format.json { render action: 'show', status: :created, location: @movie_item }     
      else
        format.html { render action: 'new' }
        format.json { render json: @movie_item.errors, status: :unprocessable_entity}
      end
    end
  end


  def update
    @movie_item = MovieItem.find(params[:id])
    respond_to do |format|
      if params[:movie_item][:quantity].to_i == 0
        @movie_item.destroy
        format.html { redirect_to @movie_item.cart, notice: "#{@movie_item.movie.title} removed"}
        format.json { head :no_content }
      elsif @movie_item.update(movie_item_params)
        format.html { redirect_to @movie_item.cart, notice: "#{@movie_item.movie.title} successfully updated by #{@movie_item.quantity}." }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @movies_item.errors, status: :unprocessable_entity }
      end
    end 
  end


  def destroy
    @movie_item.destroy
    respond_to do |format|
      format.html { redirect_to @movie_item.cart } 
      format.json { head :no_content}
    end
  end

  private
  def set_movie_item
    @movie_item = MovieItem.find(params[:id])
  end


  def movie_item_params
    params.require(:movie_item).permit(:movie_id, :cart_id, :quantity)
  end

  def current_cart
    begin
      @cart = Cart.find(session[:cart_id])
    rescue ActiveRecord::RecordNotFound
      @cart = Cart.create
      session[:cart_id] = @cart.id
    end
  end
end


