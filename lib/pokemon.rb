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
    binding.pry
    sql = <<-SQL
      INSERT INTO pokemon (name, type, db)
      VALUES (?,?)
    SQL

    DB[:conn].execute(sql, self.name, self.type)

    @id = DB[:conn].execute("SELECT last_insert_rowid() FROM pokemon")[0][0]

  end

end
