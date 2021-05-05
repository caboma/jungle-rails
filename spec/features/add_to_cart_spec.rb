require 'rails_helper'
require 'support/database_cleaner'

RSpec.feature "Visitor navigates to home page", type: :feature, js: true do
  before :each do
    @category = Category.create! name: 'Apparel'

    10.times do |n|
      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
    end
  end
  scenario "Navigate from the home page and click the 'Add to Cart' button" do
    # ACT
    visit root_path

    # DEBUG / VERIFY
    first(:button, 'Add').click
    sleep(1)
    save_screenshot "product_to_cart.png"
    expect(page).to have_text 'My Cart (1)'
  end
end
