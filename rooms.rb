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

    def add_guest(guest)
        if @guestlist.length() == @size
            return "Sorry, room is full!"
        else
            @guestlist << guest
        end
    end

    def total_bill()
        @guestlist.each { |guest| @total_bill += guest.bill() }
    end

    def display_songlist()
        @songlist.map { |song| song.name() }
    end

end
