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
    self.all << song 
    return song 
  end 
  
  def self.new_by_name(name) 
    song = self.create
    song.name = name 
    return song 
  end 
  
  def self.create_by_name(name) 
    return self.new_by_name(name) 
  end
  
  def self.find_by_name(name) 
    self.all.each do |song| 
      if song.name == name 
        return song 
      end
    end 
    return nil
  end 
  
  def self.find_or_create_by_name(name) 
    if self.find_by_name(name)
      return self.find_by_name(name)
    else
      return self.create_by_name(name)
    end 
  end
      
  def self.alphabetical 
    return self.all.sort_by{|song|song.name}
  end 
  
  def self.new_from_filename(filename)
    song_split = filename.split(' - ') 
    artist = song_split[0] 
    song_name = song_split[1].split('.')[0] 
    song = self.new_by_name(song_name) 
    song.artist_name = artist 
    return song 
  end 
  
  def self.create_from_filename(filename)
    return self.new_from_filename(filename)
  end 

  def self.destroy_all 
    self.all.clear 
  end 
end
