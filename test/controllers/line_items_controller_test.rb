require "test_helper"

class LineItemsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @line_item = line_items(:one)
  end

  test "should get index" do
    get line_items_url
    assert_response :success
  end

  test "should get new" do
    get new_line_item_url
    assert_response :success
  end

  test "should create line_item" do
    assert_difference("LineItem.count") do
      post :create, product_id: products(:ruby).id
    end
    assert_redirected_to store_url
  end

  test "should create line_item via ajax" do
    assert_difference('LineItem.count') do
      xhr :post, :create, product_id: products(:ruby).id
    end
    assert_response :success
    assert_select_jquery :html, '#cart' do
      assert_select 'tr#current_item td', /Programming Ruby 1.9/
    end
  end

  test "should show line_item" do
    get line_item_url(@line_item)
    assert_response :success
  end

  test "should get edit" do
    get edit_line_item_url(@line_item)
    assert_response :success
  end

  test "should update line_item" do
    patch :update, id: @line_item, line_item: { product_id: @line_item.product_id }
    assert_redirected_to line_item_path(assigns(:line_item))
  end

  test "should destroy line_item" do
    assert_difference("LineItem.count", -1) do
      delete line_item_url(@line_item)
    end

    assert_redirected_to line_items_url
  end
end
