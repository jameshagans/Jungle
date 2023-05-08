require 'rails_helper'

RSpec.describe Product, type: :model do
  
  describe 'Validations' do
    before do
      @category = Category.create(name: "Games")
      @product = Product.new(name: "FF7", price_cents: 5000, quantity: 1, category: @category)
    end

    context 'given a product name, price, quantity, and category' do
      it 'validates the product is created when all four fields are filled in' do
        expect(@product).to be_valid
      end
      it 'validates the product is not valid when name is not present' do
        @product.name = nil
        @product.save
        expect(@product).to_not be_valid
        expect(@product.errors.full_messages).to include("Name can't be blank")
      end
      it 'validates the product is not valid when price is not present' do
        @product.price_cents = nil
        @product.save
        expect(@product).to_not be_valid
        expect(@product.errors.full_messages).to include("Price can't be blank")
      end
      it 'validates the product is not valid when quantity is not present' do
        @product.quantity = nil
        @product.save
        expect(@product).to_not be_valid
        expect(@product.errors.full_messages).to include("Quantity can't be blank")
      end
      it 'validates the product is not valid when category is not present' do
        @product.category = nil
        @product.save
        expect(@product).to_not be_valid
        expect(@product.errors.full_messages).to include("Category can't be blank")
      end
    end

  end
end


