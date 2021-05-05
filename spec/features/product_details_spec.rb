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
  scenario "They see all products" do
    # ACT
    visit root_path

    # DEBUG / VERIFY
    save_screenshot 'products_page.png'
    expect(page).to have_css 'article.product', count: 10
  end
  scenario "Navigate from the home page to the product detail page" do
    # ACT
    visit root_path

    # DEBUG / VERIFY
    first(:link, 'Details').click
    sleep(1)
    save_screenshot "product_details.png"
    expect(page).to have_css 'section.products-show'
  end
end
