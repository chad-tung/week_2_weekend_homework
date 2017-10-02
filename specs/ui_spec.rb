require "minitest/autorun"
require "minitest/rg"
require_relative "../ui"

class TestUi < MiniTest::Test

    def setup()
        @ui = Ui.new()
    end

    def test_welcome()
        expected = "Hi, are you on the reservation list?"
        assert_equal(expected, @ui.welcome())
    end

    def test_get_reservation()
        expected = "Okay, what room are you booked into?"
        assert_equal(expected, @ui.get_reservation())
    end
end
