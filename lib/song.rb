require 'pry'

class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
  #  binding.pry
    song = self.new
    song.save
    song
  end

  def self.new_by_name(song_title)
    song = self.new
    song.name = song_title
    song
  end

  def self.create_by_name(song_title)
    song = self.new
    song.name = song_title
    song.save
    song
  end

  def self.find_by_name(song_title)
    self.all.find do |song|
      song.name == song_title
    end
  end

  def self.find_or_create_by_name(song_title)
    self.find_by_name(song_title) || self.create_by_name(song_title)
  end

  def self.alphabetical
    self.all.sort_by {|song|
      song.name
    }
  end

  def self.new_from_filename(file_name)
    song_info = file_name.split(" - ")
    song = self.new
    song.artist_name = song_info[0]
    song.name = song_info[1].chomp(".mp3")
    song
  end

  def self.create_from_filename(file_name)
    song_info = file_name.split(" - ")
    song = self.new
    song.artist_name = song_info[0]
    song.name = song_info[1].chomp(".mp3")
    song.save
  end

  def self.destroy_all
    self.all.clear
  end

end
