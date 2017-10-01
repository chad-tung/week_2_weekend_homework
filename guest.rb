class Guest

    attr_accessor :favourite_song, :bill, :order, :funds
    attr_reader :name, :age

    def initialize(name, favourite_song, age, funds)
        @name = name
        @favourite_song = favourite_song
        @bill = 0.0
        @age = age
        @order = []
        @funds = funds
    end

    def request_song(title, artist)
        @bill += 0.5
        Song.new(title, artist)
    end

    def buy(item)
        if @name == "Michael" && item.tag() == "(strawberries)"
            return "You won't like this... Order something else."
        elsif @age < 18 && item.tag() == "Alcoholic"
            return "You can't purchase alcohol, you're underage!"
        else
            @order << item.name()
            @bill += item.price()
            @funds -= item.price()
        end
    end


end
