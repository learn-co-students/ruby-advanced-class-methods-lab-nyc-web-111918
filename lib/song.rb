require "pry"

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
    song = self.new
    @@all << song
    return song
  end

  def self.new_by_name(song_name)
    song = self.create
    song.name = song_name
    song
  end

  def self.create_by_name(song_name)
    self.new_by_name(song_name)
  end

  def self.find_by_name(song_name)
    self.all.find do |song|
      song.name == song_name
    end
  end

  def self.find_or_create_by_name(song_name)
    if self.find_by_name(song_name) == nil
      self.create_by_name(song_name)
    else
      self.find_by_name(song_name)
    end
  end

  def self.alphabetical
    self.all.sort_by do |song|
      song.name[0]
    end
  end

  def self.new_from_filename(file)
    arr = file.split(" - ")
    song_name = arr[1][0..-5]
    new_song = self.create_by_name(song_name)
    new_song.artist_name = arr[0]
    new_song
  end

  def self.create_from_filename(file)
    self.new_from_filename(file).save
  end

  def self.destroy_all
    self.all.clear
  end




end #end of Song class
