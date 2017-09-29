class Drink
    attr_accessor :name, :price, :size, :tag

    def initialize(name, price, size, tag)
        @name = name
        @price = price
        @size = size
        @tag = tag
    end
end
