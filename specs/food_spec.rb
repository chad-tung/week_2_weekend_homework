require "minitest/autorun"
require "minitest/rg"
require_relative "../food"

class TestFood < MiniTest::Test
    def setup()

        @food_menu = [
            @food1 = Food.new("Chicken/Beef/Lamb/Vegetable Curry", 6.50, "Main", "(spicy)"),
            @food2 = Food.new("Cheeseburger", 7.00, "Main", "(includes chips)"),
            @food3 = Food.new("Mushroom Pasta", 7.50, "Main", "(vegetarian)"),
            @food4 = Food.new("Chips", 3.00, "Side", "(vegetarian)"),
            @food5 = Food.new("Rice", 2.20, "Side", "(vegetarian)"),
            @food6 = Food.new("Salad", 2.50, "Side", "(vegetarian)"),
            @food7 = Food.new("Chips with Cheese and Bacon", 5.00, "Side", "(specialty)"),
            @food8 = Food.new("Vanilla Ice Cream", 2.40, "Dessert", "(dairy free)"),
            @food9 = Food.new("Chocolate Truffle Meringue", 4.20, "Dessert", "(specialty)"),
            @food10 = Food.new("Strawberries and Cream", 3.60, "Dessert", "(strawberries)")
        ]
        
    end

    def test_get_food_name()
        assert_equal("Chicken/Beef/Lamb/Vegetable Curry", @food1.name())
        assert_equal("Rice", @food5.name())
    end

    def test_get_food_price()
        assert_equal(3.0, @food4.price())
        assert_equal(4.2, @food9.price())
    end

    def test_get_food_type()
        assert_equal("Main", @food2.type())
        assert_equal("Side", @food6.type())
        assert_equal("Dessert", @food8.type())
    end

    def test_get_food_tag()
        assert_equal("(vegetarian)", @food3.tag())
        assert_equal("(spicy)", @food1.tag())
        assert_equal("(specialty)", @food7.tag())
        assert_equal("(strawberries)", @food10.tag())
    end

end
