require_relative '../test_helper'

class ProductSearch < ActionDispatch::IntegrationTest

  def setup
    Capybara.app = Storedom::Application
  end

  test "product search" do
    visit root_path
    fill_in 'product[search]', with:'sennheiser'
    click_on "Search"
    assert_equal '/search', current_path

    assert page.has_content? 'SKU:'
    assert page.has_content? 'Name:'
    assert page.has_content? 'Customer Average:'
    assert page.has_content? 'Short Description:'
  end
end
