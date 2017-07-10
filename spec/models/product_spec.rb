require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validation' do
    it 'should be product' do
      expect(Product.new).to be_a Product
    end
    it 'should have valid input' do
      @category = Category.new
      @product = Product.new ({ name: 'chair', price: 20, quantity: 7, category: @category })
      expect(@product.save).to be true
    end
    it 'has a name' do
      @category = Category.new
      @product = Product.new ({name: nil, price: 1, quantity: 20, category: @category })
      @product.save
      expect(@product.errors.full_messages).to include "Name can't be blank"
    end
    it 'has a price' do
      @category = Category.new
      @product = Product.new ({name: 'chair', price: nil, quantity: 20, category: @category })
      @product.save
      expect(@product.errors.full_messages).to include "Price can't be blank"
    end
    it 'includes quantity' do
      @category = Category.new
      @product = Product.new ({name: 'chair', price: 1, quantity: nil, category: @category })
      @product.save
      expect(@product.errors.full_messages).to include "Quantity can't be blank"
    end
    it 'includes category' do
      # @category = Category.new
      @product = Product.new ({name: 'chair', price: 1, quantity: 20, category: nil })
      @product.save
      expect(@product.errors.full_messages).to include "Category can't be blank"
    end
  end
end
