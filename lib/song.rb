class Song
  attr_accessor :name, :artist_name
  @@all = []

  def initialize(name="", artist_name="")
    @name = name
    @artist_name = artist_name
    @@all << self
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    @@all << self.new
    @@all.last
  end

  def self.new_by_name(name)
    @name = name
    self.new(name)
  end

  def self.create_by_name(name)
    @name = name
    self.new(name)
  end

  def self.find_by_name(name)
    @@all.find { |song| song.name == name }
  end

  def self.find_or_create_by_name(name)
    if self.find_by_name(name)
      self.find_by_name(name)
    else
      self.create_by_name(name)
    end
  end

  def self.alphabetical
    sorted_names = @@all.map { |song| song.name }.sort
    sorted_instances = sorted_names.map { |name| @@all.find { |song| song.name == name}}
    sorted_instances
  end

  def self.new_from_filename(file)
    data = file.split(".")[0].split(" - ")
    self.new(data[1], data[0])
  end

  def self.create_from_filename(file)
    data = file.split(".")[0].split(" - ")
    self.new(data[1], data[0])
    @@all << self
  end

  def self.destroy_all
    @@all = []
  end

end
