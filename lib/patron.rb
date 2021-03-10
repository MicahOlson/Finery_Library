class Patron
  attr_reader :id
  attr_accessor :name

  def initialize(attributes)
    @name = attributes[:name]
    @id = attributes[:id]
  end

  def self.all
    returned_patrons = DB.exec("SELECT * FROM patrons;")
    patrons = []
    returned_patrons.each do |patron|
      name = patron["name"]
      id = patron["id"].to_i
      patrons.push(Patron.new({name: name, id: id}))
    end
    patrons
  end

  def ==(patron_to_compare)
    self.name == patron_to_compare.name
  end

  def save
    result = DB.exec("INSERT INTO patrons (name) VALUES ('#{@name}') RETURNING id;")
    @id = result.first["id"].to_i
  end

  def self.clear
    DB.exec("DELETE FROM patrons *;")
  end

  def self.find(id)
    patron = DB.exec("SELECT * FROM patrons WHERE id = #{id};").first
    if patron 
      name = patron["name"]
      id = patron["id"].to_i
      Patron.new({name: name, id: id})
    else
      nil
    end
  end

  def update(name)
    @name = name
    DB.exec("UPDATE patrons SET name = '#{@name}' WHERE id = #{@id};")
  end

  def delete
    DB.exec("DELETE FROM patrons WHERE id = #{@id};")
  end
end
