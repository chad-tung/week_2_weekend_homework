require_relative "rooms"
require_relative "guest"
require_relative "food"
require_relative "drink"
require_relative "song"
require_relative "ui"

def setup()

    @ui = Ui.new()

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
        @guest1 = Guest.new("Michael", @fave_song1, 18),
        @guest2 = Guest.new("Caroline", @fave_song2, 17)
    ]

    @new_guest1 = Guest.new("Third Wheel", @fave_song3, 18)

    @guestlist2 = [
        @guest3 = Guest.new("Will Smith", @fave_song4, 50),
        @guest4 = Guest.new("Tom Hanks", @fave_song5, 56)
    ]

    @songlist = [
        @song1 = Song.new("Never Gonna Give You Up", "Rick Astley"),
        @song2 = Song.new("Hey Jude", "Beatles"),
        @song3 = Song.new("Don't Stop Believin'", "Journey"),
        @song4 = Song.new("Shake it off", "Taylor Swift"),
        @song5 = Song.new("Bohemian Rhapsody", "Queen"),
        @song6 = Song.new("Eye of the Tiger", "Survivor")
    ]

    @rooms = [
        @room1 = Rooms.new(2, 20, @songlist, @guestlist1),
        @room2 = Rooms.new(3, 25, @songlist, @guestlist2)
    ]

    @bar = Bar.new(@rooms)

end
