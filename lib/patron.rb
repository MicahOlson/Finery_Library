class Patron
  attr_reader :id
  attr_accessor :name

  def intialize(attributes)
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

end