require "minitest/autorun"
require "minitest/rg"
require_relative "../drink"

class TestDrink < MiniTest::Test
    def setup()
        @drinks = [
            @drink1 = Drink.new("Tennents", 2.60, "Pint", "Alcoholic"),
            @drink2 = Drink.new("Strongbow", 3.20, "Pint", "Alcoholic"),
            @drink3 = Drink.new("Peroni", 3.60, "300ml bottle", "Alcoholic"),
            @drink4 = Drink.new("Red Wine", 2.60, "125ml glass", "Alcoholic"),
            @drink5 = Drink.new("Black Coffee", 2.00, "280ml cup", "Caffeine"),
            @drink6 = Drink.new("Cappucino", 2.40, "280ml cup", "Caffeine"),
            @drink7 = Drink.new("Latte", 2.40, "280ml cup", "Caffeine"),
            @drink8 = Drink.new("Fruit Juice", 2.60, "250ml glass", "Fruit"),
            @drink9 = Drink.new("Strathmore", 2.00, "500ml bottle", "Water"),
            @drink10 = Drink.new("Bottomless Drink", 2.40, "Bottomless", "Soda")
        ]
    end

    def test_get_drink_name()
        assert_equal("Tennents", @drink1.name())
        assert_equal("Red Wine", @drink4.name())
    end

    def test_get_drink_price()
        assert_equal(3.2, @drink2.price())
        assert_equal(2.4, @drink7.price())
    end

    def test_get_drink_size()
        assert_equal("125ml glass", @drink4.size())
        assert_equal("280ml cup", @drink6.size())
        assert_equal("Bottomless", @drink10.size())
    end

    def test_get_drink_type()
        assert_equal("Alcoholic", @drink3.tag())
        assert_equal("Caffeine", @drink5.tag())
        assert_equal("Fruit", @drink8.tag())
        assert_equal("Water", @drink9.tag())
        assert_equal("Soda", @drink10.tag())
    end

end
