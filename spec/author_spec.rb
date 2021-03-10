require 'spec_helper'

describe('#Author') do
  describe('.all') do
    it("returns an empty array when there are no authors") do
      expect(Author.all).to(eq([]))
    end
  end

  describe('#==') do
    it("is the same author if it has the same attributes as another author") do
      author = Author.new({name: "Stephen King"})
      author2 = Author.new({name: "Stephen King"})
      expect(author).to(eq(author2))
    end
  end

  describe('#save') do
    it("saves an author") do
      author = Author.new({name: "Stephen King"})
      author.save
      author2 = Author.new({name: "Neil Gaiman"})
      author2.save
      expect(Author.all).to(eq([author, author2]))
    end
  end

  describe('.clear') do
    it("clears all authors") do
      author = Author.new({name: "Neil Gaiman"})
      author.save
      author2 = Author.new({name: "Stephen King"})
      author2.save
      Author.clear
      expect(Author.all).to(eq([]))
    end
  end

  describe('.find') do
    it("finds an author by id") do
      author = Author.new({name: "Neil Gaiman"})
      author.save
      author2 = Author.new({name: "Stephen King"})
      author2.save
      expect(Author.find(author.id)).to(eq(author))
    end
  end

  describe('#update') do
    it("updates an author by id") do
      author = Author.new({name: "Neil Gaiman"})
      author.save
      author.update("Neil Gaiman")
      expect(author.name).to(eq("Neil Gaiman"))
    end
  end

  describe('#delete') do
    it("deletes an author by id") do
      author = Author.new({name: "Neil Gaiman"})
      author.save
      author2 = Author.new({name: "Stephen King"})
      author2.save
      author.delete
      expect(Author.all).to(eq([author2]))
    end
  end
end
