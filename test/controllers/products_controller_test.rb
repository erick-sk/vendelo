require 'test_helper'

class ProductsControllerTest < ActionDispatch::IntegrationTest
  test 'render a list of products' do
    get products_path

    assert_response :success
    assert_select '.product', 2
  end

  test 'render a detail product page' do
    get product_path(products(:ps4))

    assert_response :success
    assert_select '.title', 'PS4 Fat'
    assert_select '.description', 'PS4 2010'
    assert_select '.price', '$150'
  end

  test 'render a new product form' do
    get new_product_path

    assert_response :success
    assert_select 'form'
  end

  test 'allow to create a new product' do
    post products_path, params: {
      product: {
        title: 'Nintendo 64',
        description: 'No cables',
        price: 45
      }
    }

    assert_redirected_to products_path
    assert_equal flash[:notice], 'The product was successfully created.'
  end

  test 'does not allow to create a new product with empty fields' do
    post products_path, params: {
      product: {
        title: '',
        description: 'No cables',
        price: 45
      }
    }

    assert_response :unprocessable_entity
  end

  test 'render an edit product form' do
    get edit_product_path(products(:ps4))

    assert_response :success
    assert_select 'form'
  end

  test 'allow to update a product' do
    patch product_path(products(:ps4)), params: {
      product: {
        price: 120
      }
    }

    assert_redirected_to products_path
    assert_equal flash[:notice], "The product was successfully updated."
  end

  test 'does not allow to update a product' do
    patch product_path(products(:ps4)), params: {
      product: {
        price: nil
      }
    }

    assert_response :unprocessable_entity
  end

  test 'can delete products' do
    assert_difference('Product.count', -1) do
      delete product_path(products(:ps4))

      assert_redirected_to products_path
      assert_equal flash[:alert], "The product was successfully deleted."
    end
  end
end