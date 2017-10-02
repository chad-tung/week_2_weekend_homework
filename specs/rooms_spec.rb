require "minitest/autorun"
require "minitest/rg"
require_relative "../rooms"
require_relative "../guest"
require_relative "../food"
require_relative "../drink"
require_relative "../song"

class TestRooms < MiniTest::Test
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

        @fave_song1 = Song.new("Sweet Caroline", "Neil Diamond")
        @fave_song2 = Song.new("Close to You", "Carpenters")
        @fave_song3 = Song.new("Lonely", "Akon")
        @fave_song4 = Song.new("Happy", "Pharell Williams")
        @fave_song5 = Song.new("Run", "Snow Patrol")


        @guestlist1 = [
            @guest1 = Guest.new("Michael", @fave_song1, 18, 40),
            @guest2 = Guest.new("Caroline", @fave_song2, 17, 40)
        ]

        @new_guest1 = Guest.new("Third Wheel", @fave_song3, 18, 30)

        @guestlist2 = [
            @guest3 = Guest.new("Will Smith", @fave_song4, 50, 100),
            @guest4 = Guest.new("Tom Hanks", @fave_song5, 56, 100)
        ]

        @songlist = [
            @song1 = Song.new("Never Gonna Give You Up", "Rick Astley"),
            @song2 = Song.new("Hey Jude", "Beatles"),
            @song3 = Song.new("Don't Stop Believin'", "Journey"),
            @song4 = Song.new("Shake it off", "Taylor Swift"),
            @song5 = Song.new("Bohemian Rhapsody", "Queen"),
            @song6 = Song.new("Eye of the Tiger", "Survivor")
        ]

        @room1 = Rooms.new(2, 20, @songlist, @guestlist1)

        @room2 = Rooms.new(3, 24, @songlist, @guestlist2)

    end

    def test_room_properties()
        assert_equal(2, @room1.size())
        assert_equal(3, @room2.size())
        assert_equal(24, @room2.price())
        actual = @room2.guestlist().map { |guest| guest.name()}
        assert_equal(["Will Smith", "Tom Hanks"], actual)
    end


    def test_add_song()
        actual1 = @room1.add_song(@fave_song1)
        expected1 = ["Never Gonna Give You Up",
            "Hey Jude", "Don't Stop Believin'",
            "Shake it off", "Bohemian Rhapsody",
            "Eye of the Tiger", "Sweet Caroline"]
        assert_equal(expected1, actual1)
    end

    def test_checkout()
        @room2.checkout_guest("Will Smith")
        guests = @room2.guestlist().length
        assert_equal(1, guests)
        @room2.checkout_all()
        assert_equal([], @room2.guestlist())
    end

    def test_add_guest()
        assert_equal("Sorry, room is full!", @room1.add_guest(@new_guest1))
        expected = ["Will Smith", "Tom Hanks", "Third Wheel"]
        assert_equal(expected, @room2.add_guest(@new_guest1))
    end

    def test_total_bill()
        @guest3.buy(@food1)
        @guest4.buy(@food2)
        assert_equal(37.5, @room2.total_bill())
    end

    # def test_split_bill()
    #     @guest3.buy(@food1)
    #     @guest4.buy(@food2)
    #     @room1.split_bill()
    # end

    def test_display_songlist()
        @room1.add_song(@fave_song1)
        actual = @room1.display_songlist()
        expected = ["Never Gonna Give You Up",
            "Hey Jude", "Don't Stop Believin'",
            "Shake it off", "Bohemian Rhapsody",
            "Eye of the Tiger", "Sweet Caroline"]
        assert_equal(expected, actual)
    end

    def test_guest_fave_cheer()
        assert_equal("Oh, they don't have my favourite song...", @room1.guest_fave_cheer())
        @room1.add_song(@fave_song1)
        assert_equal("Whoo!", @room1.guest_fave_cheer())
    end
end
