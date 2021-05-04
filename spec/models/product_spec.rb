require 'rails_helper'

RSpec.describe Product, type: :model do
  before do
    @category = Category.new(:name => "Apparel")
  end
  describe 'Validations' do
    
    it "should check that all four fields save successfully" do
      products = Product.new(name: "Red Bookshelf", price: 20, quantity: 1, category: @category)
      expect(products).to be_valid
      expect(products.errors.full_messages).to be_empty
    end
    it "is not valid without a name" do
      products = Product.new(name: nil, price: 20, quantity: 1, category: @category)
      expect(products).to_not be_valid
      expect(products.errors.full_messages).to include("Name can't be blank")
    end
    it "is not valid without a price" do
      products = Product.new(name: "Red Bookshelf", price: nil, quantity: 1, category: @category)
      expect(products).to_not be_valid
      expect(products.errors.full_messages).to include("Price can't be blank")
    end
    it "is not valid if price is not a number" do
      products = Product.new(name: "Red Bookshelf", price: 'twenty', quantity: 1, category: @category)
      expect(products).to_not be_valid
      expect(products.errors.full_messages).to include("Price is not a number")
    end
    it "is not valid without a quantity" do
      products = Product.new(name: "Red Bookshelf", price: 20, quantity: nil, category: @category)
      expect(products).to_not be_valid
      expect(products.errors.full_messages).to include("Quantity can't be blank")
    end
    it "is not valid without a category" do
      products = Product.new(name: "Red Bookshelf", price: 20, quantity: 1, category: nil)
      expect(products).to_not be_valid
      expect(products.errors.full_messages).to include("Category can't be blank")
    end
  end
end
