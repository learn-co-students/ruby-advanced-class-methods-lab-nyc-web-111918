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

#this below is a class constructor!
#it creates an instance of a class but will only do so when we call this method on the class.
#aka Song.create
  def self.create #class constructor
   song = self.new#initialized a song. Creates a new instance of a song.
   song.save #used the save mehtod to push this to the @@all instance variable
   song #returned the instance that was initialized
  end

      #Song.new_by_name(string)
  def self.new_by_name(name) #class constructor
     song_by_name = self.create #creates a new song. This also saves it.
     song_by_name.name = name #allows us set this new instance with a song name.
     song_by_name #returns this new instance with the name of the song.
  end
      #Song.create_by_name(string)
  def self.create_by_name(name) #class constructor. This looks like the one in the reading.
     create_by_name = self.new
     create_by_name.name = name
     create_by_name.save #this is the same as @@all << self or self.class.all << self.
     create_by_name
  end

  def self.find_by_name(name) #class finder
    self.all.find {|song| song.name == name} #searches throught the @@all array for the song name that matches.
  end


  def self.find_or_create_by_name(name) #class constructor
    #if Song. can find the name of the song with the find_by_name method.
    if self.find_by_name(name)
         #return that instance of the song
         self.find_by_name(name)
    else #else create a new song with the inputs name.
         self.create_by_name(name)
    end
      #binding.pry
  end

  #Sort all songs....
  def self.alphabetical #should be a class method.
      #self.class.all.sort_by why can't I do this?
                              #name = a song instance name.name == string.
      @@all.sort_by {|name| name.name}
      # binding.pry why is this not working in pry?
  end



  def self.new_from_filename(file_name) #class constructor
    #Split the file name by the period then the dash
    #["Taylor Swift", "Blank Space"] #[0] makes it so you are working with a string agian. "Taylor Swift - Blank Space"
    parse_file_name = file_name.split(".")[0].split(" - ")
    #["Taylor Swift", "Blank Space"]
      name = parse_file_name[1]
      artist_name = parse_file_name[0]
      #Make a new instance
      new_song = self.new
      #Set the properties on the Song class
      new_song.name = name
      new_song.artist_name = artist_name
      #return the song to map
      new_song
  end

  #
  def self.create_from_filename(file_name) #class constructor
      create_from_file = self.new_from_filename(file_name)
      create_from_file.save
  end

  def self.destroy_all
    self.all.clear
  end


#binding.pry

end #end of class

song = Song.create
did_you_save_this = Song.all.include?(song)

song1 = Song.new_by_name("Blank Space")
song3 = Song.create_by_name("Sweet Home Alabama")
the_middle = Song.create_by_name("The Middle")
find_song = Song.find_by_name("The Middle")
song_1 = Song.find_or_create_by_name("Blank Space")
song_2 = Song.find_or_create_by_name("West Coast")
song_from_file = Song.new_from_filename("Taylor Swift - Blank Space.mp3")

#binding.pry
