class Author
  attr_reader :id
  attr_accessor :name

  def initialize(attrs)
    @name = attrs[:name]
    @id = attrs[:id]
  end

  def self.all
    returned_authors = DB.exec("SELECT * FROM authors;")
    authors = []
    returned_authors.each do |author|
      name = author["name"]
      id = author["id"].to_i
      authors.push(Author.new({name: name, id: id}))
    end
    authors
  end

  def ==(author_to_compare)
    self.name == author_to_compare.name
  end

  def save
    result = DB.exec("INSERT INTO authors (name) VALUES ('#{@name}') RETURNING id;")
    @id = result.first["id"].to_i
  end

  def self.clear
    DB.exec("DELETE FROM authors *;")
  end

  def self.find(id)
    author = DB.exec("SELECT * FROM authors WHERE id = #{id};").first
    if author 
      name = author["name"]
      id = author["id"].to_i
      Author.new({name: name, id: id})
    else
      nil
    end
  end

  def update(name)
    @name = name
    DB.exec("UPDATE authors SET name = '#{@name}' WHERE id = #{@id};")
  end

  def delete
    DB.exec("DELETE FROM authors WHERE id = #{@id};")
  end
end
