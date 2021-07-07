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
    new_song = Song.new
    new_song.save
    new_song
  end

  def self.new_by_name (name)
    new_song =Song.new
    new_song.name = name
    new_song
  end

  def self.create_by_name (name)
    new_song = Song.new_by_name(name)
    new_song.save
    new_song
  end

  def self.find_by_name (name)

    @@all.find { |song_instance| song_instance.name == name}

  end

  def self.find_or_create_by_name (name)

    if self.find_by_name(name) == nil
      self.create_by_name(name)
#
    else
      self.find_by_name(name)
    end
  end

  def self.alphabetical

    @@all.sort_by do |song_instance|
      song_instance.name
    end
  end

  def self.new_from_filename(song_mp3_format)

    split_mp3_array = song_mp3_format[0...-4].split(' - ')

    formated_song = self.find_or_create_by_name(split_mp3_array[-1])

    formated_song.artist_name = split_mp3_array[0]
    formated_song

  end

  def self.create_from_filename (song_mp3_format)
    split_mp3_array = song_mp3_format[0...-4].split(' - ')

    formated_song = self.find_or_create_by_name(split_mp3_array[-1])

    formated_song.artist_name = split_mp3_array[0]
    formated_song
  end

  def self.destroy_all
    @@all = []
  end



end
