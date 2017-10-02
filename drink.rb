class Drink
    attr_accessor :name, :price, :size, :tag

    def initialize(name, price, size, tag)
        @name = name
        @price = price
        @size = size
        @tag = tag
    end

    def display_drinks()
    end
end
