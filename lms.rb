class Library
  attr_accessor :name, :shelves
  
  def initialize(name)
    @name = name
    @shelves = Array.new	
  end
  
  def shelves_count
    @shelves.length
  end
  
  def status
    @shelves.each do |shelf|
	  shelf.books.each do |book|
	    puts "#{shelf.name} has #{book.name}"
	  end
	end
  end
end

class Shelf
  attr_accessor :name, :books
  def initialize(name)
    @name = name
    @books = Array.new
  end
  
  def books_count
    @books.length
  end
end

class Book
  attr_accessor :name, :shelf
  
  def initialize(name)
    @name = name
    @shelf = nil
  end
  
  def enshelf(shelf)
    if @shelf.nil?
	  shelf.books.push self
	  @shelf = shelf
	else
	  puts "Invalid location. Book already placed at #{@shelf.name}" 
	end
  end
  
  def unshelf
    @shelf.books = @shelf.books - [ self ]
    @shelf = nil
  end
end

library = Library.new("Library 001")

# Library should be aware of selves count
puts "#{library.name} has #{ library.shelves_count } shelves"


# Creating 3 selves and assiging to library
puts "Assiging first shelf to library"
shelf1 = Shelf.new("Shelf 001")
library.shelves.push shelf1

puts "Assiging second shelf to library"
shelf2 = Shelf.new("Shelf 002")
library.shelves.push shelf2

puts "Assiging third shelf to library"
shelf3 = Shelf.new("Shelf 003")
library.shelves.push shelf3

# Now library has 3 shelves
puts "Now library has 3 shelves"
puts "#{library.name} has #{ library.shelves_count } shelves"

# Creating new book in library
book1 = Book.new("Book 001")

#Placing book at shelf 001
book1.enshelf(shelf1)

#Library status should show the book in shelf001
puts "###############################################"
puts "###################Library status##############"
puts "###############################################"
library.status


#When book is in one shelf then it should be places in other shelf
puts "###############################################"
puts "##############Invalid placement of book########"
puts "###############################################"
book1.enshelf(shelf2)

#Remove book from current shelf
book1.unshelf

#Now place book on shelf002
book1.enshelf(shelf2)

#Library status should show the book in shelf002
puts "###############################################"
puts "###################Library status##############"
puts "###############################################"
library.status


