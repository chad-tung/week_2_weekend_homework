class Rooms

    attr_accessor :size, :price, :songlist, :guestlist
    attr_reader :total_bill

    def initialize(size, price, songlist, guestlist)
        @size = size.to_i
        @price = price.to_f
        @songlist = songlist
        @guestlist = guestlist
        @total_bill = price
    end

    def add_song(song)
        @songlist << song
        return @songlist.map{|song| song.name()}
    end

    def checkout_guest(name)
        for guest in @guestlist
            if guest.name() == name
                @guestlist.delete(guest)
            end
        end
    end

    def checkout_all()
        @guestlist = []
    end


    def add_guest(guest)
        if @guestlist.length() == @size
            return "Sorry, room is full!"
        else
            @guestlist << guest
            @guestlist.map { |person| person.name() }
        end
    end

    def total_bill()
        @guestlist.each { |guest| @total_bill += guest.bill() }
        return @total_bill
    end

    # def split_bill()
    #     for guest in @guestlist
    #         guest.bill() += @price/@guestlist.length()
    #     end
    # end

    def display_songlist()
        @songlist.map { |song| song.name() }
    end

    def guest_fave_cheer()
        for guest in @guestlist
            if @songlist.include?(guest.favourite_song())
                return "Whoo!"
            else
                return "Oh, they don't have my favourite song..."
            end
        end
    end

end
