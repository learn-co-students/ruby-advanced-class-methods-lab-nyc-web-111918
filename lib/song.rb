class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end
  #
  # Song Class Methods
  #   .create
  #     instantiates and saves the song, and it returns the new song that was created (FAILED - 1)

  def self.create
    song = self.new
    song.save
    song
  end

  #   .new_by_name
  #     instantiates a song with a name property (FAILED - 2)

  def self.new_by_name(song_name)
    song = self.new
    song.name = song_name
    song
  end

  #   .create_by_name
  #     instantiates and saves a song with a name property (FAILED - 3)

  def self.create_by_name(name)
    song = self.new_by_name(name)
    song.save
    song
  end

  #   .find_by_name
  #     can find a song present in @@all by name (FAILED - 4)
  #     returns falsey when a song name is not present in @@all (FAILED - 5)

  def self.find_by_name(name)
    self.all.find {|song| song.name == name}
  end

  #   .find_or_create_by_name
  #     invokes .find_by_name and .create_by_name instead of repeating code (FAILED - 6)
  #     returns the existing Song object (doesn't create a new one) when provided the title of an existing Song (FAILED - 7)
  #     creates a new Song object with the provided title if one doesn't already exist (FAILED - 8)

  def self.find_or_create_by_name(name)
    if self.find_by_name(name) == nil
      self.create_by_name(name)
    else self.find_by_name(name)
    end
  end

  #   .alphabetical
  #     returns all the song instances alphabetical order by song name (FAILED - 9)

  def self.alphabetical
    song_names = self.all.map { |song| song.name }
    alphabetical = song_names.sort
    alphabetical.map {|name| self.find_by_name(name)}
  end
  #   .new_from_filename
  #     initializes a song and artist_name based on the filename format (FAILED - 10)

  def self.new_from_filename(file_name)
    song_info = file_name.split(" - ")
    song = self.new_by_name(song_info[1].chomp(".mp3"))
    song.artist_name = song_info[0]
    song
  end

  #   .create_from_filename
  #     initializes and saves a song and artist_name based on the filename format (FAILED - 11)

  def self.create_from_filename(file_name)
    save_song = self.new_from_filename(file_name)
    save_song.save
    save_song
  end

  #   .destroy_all
  #     clears all the song instances from the @@all array (FAILED - 12)

  def self.destroy_all
    self.all.clear
  end

end
