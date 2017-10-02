class Food

    attr_accessor :name, :price, :type, :tag

    def initialize(name, price, type, tag)
        @name = name
        @price = price
        @type = type
        @tag = tag
    end

    def display_food(food_menu)
        puts "Food Menu".center()
        for food in food_menu
            type_tag = @type + ", " + @tag
            puts @name.ljust(30) + @price.center(50) + type_tag.rjust(70)
        end
    end

end
