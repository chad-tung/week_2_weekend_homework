require "minitest/autorun"
require "minitest/rg"
require_relative "../song"

class TestSong < MiniTest::Test
    def setup()
        @song1 = Song.new("Never Gonna Give You Up", "Rick Astley")
        @song2 = Song.new("Hey Jude", "Beatles")
        @song3 = Song.new("Don't Stop Believin'", "Journey")
    end

    def test_get_song_name()
        assert_equal("Never Gonna Give You Up", @song1.name())
        assert_equal("Hey Jude", @song2.name())
        assert_equal("Don't Stop Believin'", @song3.name())
    end

    def test_get_song_artist()
        assert_equal("Rick Astley", @song1.artist())
        assert_equal("Beatles", @song2.artist())
        assert_equal("Journey", @song3.artist())
    end
end
