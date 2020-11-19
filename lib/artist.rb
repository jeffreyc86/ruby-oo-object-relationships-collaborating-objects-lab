class Artist

    attr_accessor :name

    @@all = []

    def initialize(name)
        @name = name
        @@all << self
    end
    
    def self.all
        @@all
    end

    def songs
        Song.all.select { |song| song.artist == self }
    end

    def add_song(song)
        song.artist = self
    end

    def self.find_or_create_by_name(artist_name)
        found_artist = self.all.find { |artist| artist.name == artist_name }
        if found_artist
            found_artist
        else
            Artist.new(artist_name)
        end
    end

    def print_songs
        self.songs.each { |song| puts song.name }
    end


end
