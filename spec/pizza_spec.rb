require 'rubygems'
require 'bundler/setup'
require 'rspec'
require_relative '../pizza'

describe Pizza::Pie do
  let(:pizza) { Pizza::Pie.new }

  describe '.initialize' do
    it 'record all of the toppings' do
      toppings = [
        Pizza::Topping.new('mushrooms', vegetarian: true),
        Pizza::Topping.new('pepperoni')
      ]
      pizza.toppings = toppings

      expect(pizza.toppings).to eq(toppings)
    end
    it 'defaults the toppings to cheese only, if the pizza has no toppings' do
      expect(pizza.toppings.size).to eq(1)
      expect(pizza.toppings.first.name).to eq('cheese')
    end
  end
  describe '#vegetarian?' do
    context 'if all toppings are vegetarian' do
      it 'returns true when all toppings on the pie are vegetarian' do
        expect(pizza.vegetarian?).to eq(true)
      end
    end
    context 'if all toppings are not vegetarian' do
      it 'returns false when all toppings on the pie are not vegetarian' do
        meaty_pizza = Pizza::Pie.new([Pizza::Topping.new('cheese', vegetarian: true), Pizza::Topping.new('italian sausage', vegetarian: false)])

        expect(meaty_pizza.vegetarian?).to eq(false)
      end
    end
  end
  describe '#add_topping' do
    it 'adds a new topping to the toppings array' do
      olive = Pizza::Topping.new('olive', vegetarian: true)
      pizza.add_topping(olive)

      expect(pizza.toppings.include?(olive)).to eq(true)
    end
  end
end 

describe Pizza::Topping do
  describe '.initialize' do
    it "sets the name of the topping" do 
      topping = Pizza::Topping.new('olives')

      expect(topping.name).to eq('olives')
    end
  
    it 'sets whether or not the topping is vegetarian' do
      topping = Pizza::Topping.new 'bell peppers', vegetarian: true

      expect(topping.vegetarian).to eq(true)
    end
  end
end