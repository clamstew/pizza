require 'rubygems'
require 'bundler/setup'
require 'rspec'
require_relative '../pizza'

describe Pizza::Pie do

end 

describe Pizza::Topping do
  describe '.initialize' do
    it "sets the name of the topping" do 
      topping = Pizza::Topping.new('olives')

      expect(topping.name).to eq('olives')
    end
  end
end