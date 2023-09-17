require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    it 'should save successfully with all fields set' do
      category = Category.new(name: 'Trees')
      product = Product.new(
        name: 'Oak Tree',
        price: 999.99,
        quantity: 5,
        category: category
      )
      expect(product).to be_valid
    end

    it 'should not save without a name' do
      category = Category.new(name: 'Flowers')
      product = Product.new(
        name: nil,
        price: 999.99,
        quantity: 5,
        category: category
      )
      expect(product).to_not be_valid
      expect(product.errors.full_messages).to include("Name can't be blank")
    end

    it 'should not save without a price' do
      category = Category.new(name: 'Flowers')
      product = Product.new(
        name: 'Sunflower',
        price_cents: nil,
        quantity: 5,
        category: category
      )
      
      expect(product).to_not be_valid
      expect(product.errors.full_messages).to include("Price can't be blank")
    end

    it 'should not save without a quantity' do
      category = Category.new(name: 'Flowers')
      product = Product.new(
        name: 'Tulip',
        price: 999.99,
        quantity: nil,
        category: category
      )
      expect(product).to_not be_valid
      expect(product.errors.full_messages).to include("Quantity can't be blank")
    end

    it 'should not save without a category' do
      product = Product.new(
        name: 'Rose',
        price: 999.99,
        quantity: 5,
        category: nil
      )
      expect(product).to_not be_valid
      expect(product.errors.full_messages).to include("Category can't be blank")
    end
  end
end
