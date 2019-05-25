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

  def self.find(id_num, db)
    # binding.pry
    sql = <<-SQL
      SELECT *
      FROM pokemon
      WHERE id = ?
      SQL



# def self.find(id_num, db) 
#   pokemon_info = db.execute("SELECT * FROM pokemon WHERE id=?", id_num).flatten 
#       Pokemon.new(id: pokemon_info[0], name: pokemon_info[1], type: pokemon_info[2], hp: pokemon_info[3], db: db)
#    end
# binding.pry
      new_pokemon = db.execute(sql, id_num).flatten#.each {|row| binding.pry
      # binding.pry
      Pokemon.new(id: new_pokemon[0], db: db) #, name, type)
      # binding.pry
    # end
  end

end
