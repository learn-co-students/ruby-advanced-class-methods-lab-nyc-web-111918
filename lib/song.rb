require 'pry'

class Song

  attr_accessor :name, :artist_name

  @@all = []

  def initialize
    # binding.pry
    @@all << self
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    # binding.pry
    song = self.new
    song.save
    song
  end

  def self.new_by_name(name)
    # binding.pry
    new_by_names = self.new #self is class Song, Song.create uses create class method to initialize new song and save it class @@all array.
    #new_by_names is not yet using the argument.
    #name is an read/write variable so there is a name= method defined by the attr_accessor already
    new_by_names.name = name #use name= method to set name to passed argument
    new_by_names
  end

  def self.create_by_name(name)
    # binding.pry
    creates_by_name = self.new #self is class Song, Song.create uses create class method to initialize new song and save it class @@all array.
    #creates_by_name is not yet using the argument.
    #name is an read/write variable so there is a name= method defined by the attr_accessor already
    creates_by_name.name = name #use name= method to set name to passed argument
    creates_by_name
  end

  def self.find_by_name(name)
    # binding.pry
    #@@all is an array of Songs (instances of Song class) if created by name they have a name attribute.
    #to find a mathcing song by name i need to look through the array which is self.all for songs whose name == argument
    self.all.find do |song_name|
      song_name.name == name
    end
  end

  def self.find_or_create_by_name(name)
    if find_by_name(name)
      self.find_by_name(name)
    else
      self.create_by_name(name)
    end
  end

  def self.alphabetical
    # binding.pry
    #sort!
    #won't sort on own, shouldn't use sort! that cahnges actual array
    #try storing sort in variable and returning that, use Sort_by enumerable,
    sorted_names = self.all.sort_by do |song_name|
      # binding.pry # thank you pry! song_name is the song object, makes sense it is the ith elemtn of the @@all array. @@all is already Self.all
      song_name.name
    end
    return sorted_names
  end

  def artist_name
    @artist_name
  end

  def artist_name=(name)
    @artist_name = name
  end

  def self.new_from_filename(file_name)
    # binding.pry
    #test shows name and song mixed into filename. split and identify.
    new_song_array = file_name.split(".")[0].split(" - ") #file name is string, split by period to get before mp3 then by sapced dash to get song and artist.
    #don't need to flatten. the original split is not preserved since we only looked into 0th element
    # binding.pry
    #below code uses existing class methods to initializenew song using the song name from above split
    #this also saves the new song to @@all and then sets the artist name
    name = new_song_array[1]
    artist_name = new_song_array[0]
    song = self.new
    song.name = name
    song.artist_name = artist_name
    return song
  end

  def self.create_from_filename(file_name)
      self.new_from_filename(file_name).save
      # song.save
  end

  def self.destroy_all
    self.all.clear
  end
end #end of Song class
