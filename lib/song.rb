require 'pry'
class Song
                #basic properties
  attr_accessor :name, :artist_name
  #class variable stores all instances for Song
    #that are created through instance method Song#save
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  #build a class constructor Song.create
  def self.create
  #that initializes a song
    song = self.new
  #and saves it to the @@all class variable either literally
  #or through the class method Song.all
    @@all << song
    song
  end

  #build a class constructor Song.new_by_name
    #that takes in the string name of a song
  def self.new_by_name(name)
  #and returns a song instance with that name set as its name property
    song = self.new
    song.name = name
  #should return an instance of Song and not a simple string or anything else.
    song
  end

  #build a class constructor Song.create_by_name
    #that takes in the string name of a song
  def self.create_by_name(name)
  #and returns a song instance with that name set as its
    #name property
    song = self.new
    song.name = name
  #and the song being saved into the @@all class variable
    song.save
    song
  end

  #build a class finder Song.find_by_name
  #that accepts the string name of a song
  def self.find_by_name(name)
  # #and returns the matching instance of the song with that name.
    @@all.find { |song| song.name == name }
  end

  #build a Song.find_or_create_by_name class method
    #that accepts a string name for a song
  def self.find_or_create_by_name(name)
  #and either returns a matching song instance with that name
    if self.find_by_name(name) == nil
      self.create_by_name(name)
    else
      self.find_by_name(name)
    end
  #or creates a new song with the name
  #and returns the song instance
  end
  # binding.pry

  def self.alphabetical
    @@all.sort_by! { |song| song.name }
  end

  def self.new_from_filename(file_name)
    song = self.new
    #SUPA HACKED
    song.name = file_name.split(" - ")[1].split(".")[0]
    song.artist_name = file_name.split(" - ")[0]

    song
  end

  def self.create_from_filename(file_name)
    song = self.new
    song.name = file_name.split(" - ")[1].split(".")[0]
    song.artist_name = file_name.split(" - ")[0]

    song.save
    song
  end

  def self.destroy_all
    @@all = []
  end
end
