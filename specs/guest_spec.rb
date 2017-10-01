require "minitest/autorun"
require "minitest/rg"
require_relative "../guest"
require_relative "../food"
require_relative "../drink"
require_relative "../song"


class TestGuest < MiniTest::Test
    def setup()
        @food1 = Food.new("Cheeseburger", 7.00, "Main", "(includes chips)")
        @food2 = Food.new("Strawberries and Cream", 3.60, "Dessert", "(strawberries)")
        @drink1 = Drink.new("Peroni", 3.60, "300ml bottle", "Alcoholic")
        @drink2 = Drink.new("Fruit Juice", 2.60, "250ml glass", "Fruit")

        @fave_song1 = Song.new("Sweet Caroline", "Neil Diamond")
        @fave_song2 = Song.new("Close to You", "Carpenters")

        @guest1 = Guest.new("Michael", @fave_song1, 18, 40)
        @guest2 = Guest.new("Caroline", @fave_song2, 17, 40)
    end

    def test_get_guest_info()
        assert_equal("Michael", @guest1.name())
        assert_equal(@fave_song2, @guest2.favourite_song())
        assert_equal(17, @guest2.age())
        assert_equal("Sweet Caroline", @guest1.favourite_song.name())
    end

    def test_buy_items()
        @guest1.buy(@food1)
        @guest1.buy(@drink1)
        @guest2.buy(@food2)
        @guest2.buy(@drink2)
        assert_equal(10.60, @guest1.bill())
        assert_equal(6.20, @guest2.bill())
        assert_equal(29.40, @guest1.funds())
        assert_equal(33.80, @guest2.funds())
        assert_equal(["Cheeseburger", "Peroni"], @guest1.order())
        assert_equal(["Strawberries and Cream", "Fruit Juice"], @guest2.order())
    end

    def test_song_request()
        @guest2.request_song("Happy Birthday", "Anon")
        @guest2.request_song("Clocks", "Coldplay")
        @guest2.request_song("Wrecking Ball", "Miley Cyrus")
        assert_equal(1.50, @guest2.bill())
    end

    def test_transaction_declined()
        assert_equal("You won't like this... Order something else.", @guest1.buy(@food2))
        assert_equal("You can't purchase alcohol, you're underage!", @guest2.buy(@drink1))
    end

end
