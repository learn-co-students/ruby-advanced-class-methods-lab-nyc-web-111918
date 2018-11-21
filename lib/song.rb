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
    song = Song.new
    song.save
    song
  end

  def self.new_by_name(song_name)
    song = Song.new
    song.name = song_name
    song
  end

  def self.create_by_name(song_name)
    song = self.create
    song.name = song_name
    song
  end

  def self.find_by_name(song_name)
    @@all.each do |tune|
      if tune.name == song_name
        return tune
      end
    end
    nil
  end

  def self.find_or_create_by_name(song_name)
    self.find_by_name(song_name) || self.create_by_name(song_name)
  end

  def self.alphabetical
    self.all.sort_by {|song| song.name}
  end

  def self.new_from_filename(filename)
    song_words = filename.split(" - ")
    artist_name = song_words[0]
    song_name = song_words[1][0...-4]
    song = self.create
    song.artist_name = artist_name
    song.name = song_name
    song
  end

  def self.create_from_filename(filename)
    song_words = filename.split(" - ")
    artist_name = song_words[0]
    song_name = song_words[1][0...-4]
    song = self.create
    song.artist_name = artist_name
    song.name = song_name
    song.save
  end

  def self.destroy_all
    @@all.length.times do |song|
      @@all.pop
    end
  end
end
