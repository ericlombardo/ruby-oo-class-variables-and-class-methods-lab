require 'pry'

class Song
  
  @@count = 0
  @@genres = []
  @@artists = []
  
  attr_accessor :name, :artist, :genre, :genre_count, :artist_count
  def initialize(name, artist, genre)
    @name = name
    @artist = artist
    @genre = genre
    @@count += 1
    @@genres << genre
    @@artists << artist
  end
  def self.count
    @@count
  end

  def self.genres
    @@genres.uniq
  end

  def self.artists
    @@artists.uniq
  end

  def self.genre_count
    @genre_count = {}   # make empty hash
    @@genres.each do |genre|    # loop through @@genres
      # check if genre already exists, true => adds 1 to value, false => creates key and sets value at 1
      @genre_count.keys.include?(genre) ? @genre_count[genre] += 1 : @genre_count[genre] = 1  
    end
    @genre_count    #return hash, key == uniq_genre, val == count of songs in genre
  end

  def self.artist_count
    @artist_count = {}    # make empty hash
    @@artists.each do |artist|    # loop through artist array
      # check if artist already exists in key, true => add 1 to value, false => creates key and sets value to 1
      @artist_count.keys.include?(artist) ? @artist_count[artist] += 1 : @artist_count[artist] = 1
    end
    @artist_count   # return hash, key == uniq_artist, val == song count
  end
end
