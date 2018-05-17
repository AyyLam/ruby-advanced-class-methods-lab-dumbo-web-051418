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
  end 
  
  def self.find_or_create_by_name(name) 
    if name == ' '
      return nil
    elsif self.find_by_name(name)
      return self.find_by_name(name)
    else
      return self.create_by_name(name)
    end 
  end
      
  def self.alphabetical 
    return self.all.sort_by{|song|song}
  end 
  
  def self.new_from_filename(filename)
  end 
  
  def self.create_from_filename(filename)
  end 

  def self.destroy_all 
    self.all.clear 
  end 
end
