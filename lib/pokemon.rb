require 'pry'

class Pokemon
  attr_accessor :id, :name, :type, :db

  # binding.pry
  def initialize(id:, name:, type:, db:)
    # binding.pry
    @id = id
    @name = name
    @type = type
    @db = db
  end

  def self.save(name, type, db)
    sql = <<-SQL
      INSERT INTO pokemon (name, type)
      VALUES (?,?)
    SQL

    db.execute(sql, name, type)

    @id = db.execute("SELECT last_insert_rowid() FROM pokemon")[0][0]
  end

  # def self.new_from_db(row)
  #   binding.pry
  #   id = row[0]
  #   name = row[1]
  #   type = row[2]
  #   self.new(id, name, type)
  # end

  def self.find(id, db)
    # binding.pry
    sql = <<-SQL
      SELECT *
      FROM pokemon
      WHERE id = ?
    SQL

# binding.pry
      db.execute(sql, id)#.each {|row| binding.pry Pokemon.new(id)}
      # binding.pry
      # Pokemon.new(id, db)
      # id = row[0]
      # name = row[1]
      # type = row[2]
      # binding.pry
      new_pokemon = self.new(id, name, type, db) #, name, type)
      # binding.pry
    # end
  end

end
