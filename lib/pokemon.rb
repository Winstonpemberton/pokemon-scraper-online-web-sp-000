require 'pry'
class Pokemon
  attr_accessor :id, :name, :type, :db

  def initialize(db)
    @id = id
    @name = name
    @type = type
    @db = db
  end

  def self.save(name, type, db)
    sql = <<-SQL
      INSERT INTO pokemon(name, type)
      VALUES (?, ?)
    SQL

    db.execute(sql, name, type)
  end

  def self.find_by_name(id, db)
    sql = <<-SQL
      Select * From pokemon
      Where id = ?
    SQL
    pokemon = db.execute(sql, [id]).flatten
    Pokemon.new(id, pokemon[1], pokemon[2], pokemon[3], db )
  end

end
