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
    # initialize a song
    song = Song.new
    # save it to the @@all class variable via save method
    song.save
    # return the song instance
    song
  end

  def self.new_by_name(name)
    song = Song.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = Song.new
    song.name = name
    song.save
    song
  end

  def self.find_by_name(name)
    @@all.find do |song|
      song.name == name
    end
  end

  def self.find_or_create_by_name(name)
    if !self.find_by_name(name)
      self.create_by_name(name)
    else
      self.find_by_name(name)
    end
  end

  def self.alphabetical
    self.all.sort_by { |song| song.name }
  end

  def self.new_from_filename(filename)
    # "Taylor Swift - Blank Space.mp3"
    song = Song.new
    # ["Taylor Swift", "Blank Space.mp3"]
    artist_title_arr = filename.split(" - ")
    # ["Taylor Swift"]
    artist_name = artist_title_arr[0]
    # ["Blank Space"]
    song_title = artist_title_arr[1].split('.').join('').chomp('mp3')
    song.name = song_title
    song.artist_name = artist_name
    song
  end

  def self.create_from_filename(filename)
    song = Song.new
    artist_title_arr = filename.split(" - ")
    artist_name = artist_title_arr[0]
    song_title = artist_title_arr[1].split('.').join('').chomp('mp3')
    song.name = song_title
    song.artist_name = artist_name
    song.save
    song
  end

  def self.destroy_all
    @@all = []
  end

end
