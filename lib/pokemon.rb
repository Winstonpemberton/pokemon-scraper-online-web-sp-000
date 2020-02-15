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
      Limit 1
    SQL
    binding.pry
    db.execute(sql, id).flatten
  end

end
