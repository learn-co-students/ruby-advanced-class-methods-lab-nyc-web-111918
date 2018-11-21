class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end
  def self.create
    song=Song.new
    song.save
    song
  end

  def self.new_by_name(name)
    song=Song.new
    song.name=name
    song
  end

  def self.create_by_name(name)
    song=self.new_by_name(name)
    song.save
    song
  end

  def self.find_by_name(songname)
    foundsong=@@all.select{ |song| song.name==songname}
    foundsong[0]
  end

  def self.find_or_create_by_name(songname)
    result=self.find_by_name(songname)
    if !result
      self.create_by_name(songname)
    else
      result
    end
  end

  def self.alphabetical
    @@all.sort_by{|song| song.name}
  end

  def self.new_from_filename(filename)
    filearray=filename.split(" - ")
    song=self.create_by_name(filearray[1].chomp(".mp3"))
    song.artist_name=filearray[0]
    song
  end

  def self.create_from_filename(filename)
    song=self.new_from_filename(filename)
    song.save
    song
  end


  def self.destroy_all
    @@all=[]
  end
  
  def save
    self.class.all << self
  end

end
