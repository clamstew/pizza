module Pizza
  class Pie
    attr_accessor :toppings
    # Instantiate a new topping.
    #
    # toppings - The Array of toppings - must be toppings objects
    #
    #
    # Returns a new Pie object.
    def initialize (toppings = [Pizza::Topping.new('cheese', vegetarian: true)])
      @toppings = toppings 
    end

    def vegetarian?
      @toppings.any? { |topping| topping.vegetarian == false } ? false : true
    end
  end

  class Topping
    attr_accessor :name, :vegetarian
    # Instantiate a new topping.
    #
    # name - The String name of the topping.
    # vegetarian - The Boolean indicating whether or not the topping is
    #              vegetarian.
    #
    #
    # Returns a new Topping object.
    def initialize name, vegetarian: false
      @name = name
      @vegetarian = vegetarian
    end
  end
end