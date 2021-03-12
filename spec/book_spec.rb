require 'spec_helper'

describe('#Book') do
  describe('.all') do
    it("returns an empty array when there are no books") do
      expect(Book.all).to(eq([]))
    end
  end

  describe('#==') do
    it("is the same book if it has the same attributes as another book") do
      book = Book.new({title: "The Talisman"})
      book2 = Book.new({title: "The Talisman"})
      expect(book).to(eq(book2))
    end
  end

  describe('#save') do
    it("saves an book") do
      book = Book.new({title: "The Talisman"})
      book.save
      book2 = Book.new({title: "Cujo"})
      book2.save
      expect(Book.all).to(eq([book, book2]))
    end
  end

  describe('.clear') do
    it("clears all books") do
      book = Book.new({title: "The Talisman"})
      book.save
      book2 = Book.new({title: "Cujo"})
      book2.save
      Book.clear
      expect(Book.all).to(eq([]))
    end
  end

  describe('.find') do
    it("finds an book by id") do
      book = Book.new({title: "The Talisman"})
      book.save
      book2 = Book.new({title: "Cujo"})
      book2.save
      expect(Book.find(book.id)).to(eq(book))
    end
  end

  describe('#update') do
    it("updates an book by id") do
      book = Book.new({title: "The Talisman"})
      book.save
      book.update("Cujo")
      expect(book.title).to(eq("Cujo"))
    end
  end

  describe('#delete') do
    it("deletes an book by id") do
      book = Book.new({title: "The Talisman"})
      book.save
      book2 = Book.new({title: "Cujo"})
      book2.save
      book.delete
      expect(Book.all).to(eq([book2]))
    end
  end

  describe('#add_author') do
    it("adds author and book id relationship to authors_books JOIN table only once") do
      book = Book.new({title: "The Talisman"})
      book.save
      book2 = Book.new({title: "Cujo"})
      book2.save
      book3 = Book.new({title: "Stardust"})
      book3.save
      
      author = Author.new({name: "Stephen King"})  # authored The Talisman, Cujo
      author.save
      author2 = Author.new({name: "Peter Straub"})  # authored The Talisman
      author2.save
      author3 = Author.new({name: "Neil Gaiman"})  # authored Stardust
      author3.save
      
      book.add_author(author.id)
      book.add_author(author2.id)
      book2.add_author(author.id)
      book3.add_author(author3.id)
      
      book.add_author(author.id)
      book.add_author(author2.id)
      book2.add_author(author.id)
      book3.add_author(author3.id)
      
      expect(book.authors).to(eq([author, author2]))
      expect(book3.authors).to(eq([author3]))
    end
  end
end
