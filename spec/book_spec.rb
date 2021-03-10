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





end