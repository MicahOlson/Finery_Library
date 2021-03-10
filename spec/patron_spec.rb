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

  describe('#save') do
    it("saves an patron") do
      patron = Patron.new({name: "Matthew"})
      patron.save
      patron2 = Patron.new({name: "Julie"})
      patron2.save
      expect(Patron.all).to(eq([patron, patron2]))
    end
  end

  describe('.clear') do
    it("clears all patrons") do
      patron = Patron.new({name: "Julie"})
      patron.save
      patron2 = Patron.new({name: "Matthew"})
      patron2.save
      Patron.clear
      expect(Patron.all).to(eq([]))
    end
  end

  describe('.find') do
    it("finds an patron by id") do
      patron = Patron.new({name: "Julie"})
      patron.save
      patron2 = Patron.new({name: "Matthew"})
      patron2.save
      expect(Patron.find(patron.id)).to(eq(patron))
    end
  end

  describe('#update') do
    it("updates an patron by id") do
      patron = Patron.new({name: "Julie"})
      patron.save
      patron.update("Julie")
      expect(patron.name).to(eq("Julie"))
    end
  end

  describe('#delete') do
    it("deletes an patron by id") do
      patron = Patron.new({name: "Julie"})
      patron.save
      patron2 = Patron.new({name: "Matthew"})
      patron2.save
      patron.delete
      expect(Patron.all).to(eq([patron2]))
    end
  end
end
