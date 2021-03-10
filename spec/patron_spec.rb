require 'spec_helper'

describe('#Patron') do
  describe('.all') do
    it("returns an empty array when there are no patrons") do
      expect(Patron.all).to(eq([]))
    end
  end

  describe('#==') do
    it("is the same patron if it has the same attributes as another patron") do
      patron = Patron.new({name: "Matthew"})
      patron2 = Patron.new({name: "Matthew"})
      expect(patron).to(eq(patron2))
    end
  end





end
