class Ui
    def initialize()
    end

    def welcome()
        puts "Hi, are you on the reservation list?"
        gets.chomp.downcase()
        if answer == "yes"
            return true
        else
            puts "Sorry, we are fully booked today!"
            exit
        end
    end

    def get_reservation()
        puts "Okay, what room are you booked into?"
        answer = gets.chomp()
    end


end

def setup()
    @ui = Ui.new()
end

@ui.welcome()
