require 'test_helper'

class FavoritesControllerTest < ActionDispatch::IntegrationTest
  setup do
    login
    @megadrive = products(:megadrive)
    @ps5 = products(:ps5)
  end

  test 'should create favorite' do
    assert_difference('Favorite.count', 1) do
      post favorites_url(product_id: @megadrive.id)
    end

    assert_redirected_to product_path(@megadrive)
  end

  test 'should remove favorite' do
    assert_difference('Favorite.count', -1) do
      delete favorite_url(@ps5.id)
    end

    assert_redirected_to product_path(@ps5)
  end
end