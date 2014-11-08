require 'test_helper'

class MovieItemsControllerTest < ActionController::TestCase
  setup do
    @movie_item = movie_items(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:movie_items)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create movie_item" do
    assert_difference('MovieItem.count') do
      post :create, movie_item: { cart_id: @movie_item.cart_id, movie_id: @movie_item.movie_id, quantity: @movie_item.quantity }
    end

    assert_redirected_to movie_item_path(assigns(:movie_item))
  end

  test "should show movie_item" do
    get :show, id: @movie_item
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @movie_item
    assert_response :success
  end

  test "should update movie_item" do
    patch :update, id: @movie_item, movie_item: { cart_id: @movie_item.cart_id, movie_id: @movie_item.movie_id, quantity: @movie_item.quantity }
    assert_redirected_to movie_item_path(assigns(:movie_item))
  end

  test "should destroy movie_item" do
    assert_difference('MovieItem.count', -1) do
      delete :destroy, id: @movie_item
    end

    assert_redirected_to movie_items_path
  end
end
