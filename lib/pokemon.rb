class Pokemon
  
  attr_accessor :id, :name, :type, :db
  
  def initialize(id:,name:,type:,db:)
    @id = id 
    @name = name 
    @type = type 
    @db = db
  end 
  
  def self.save(name,type,db)
    sql = "INSERT INTO pokemon(name,type) VALUES (?,?);",name, type
    
    DB[:conn].execute(sql)
  end
  
  def self.find(id)
    sql = "SELECT * FROM pokemon WHERE id = ?",id
     pokemon = DB[:conn].execute(sql,db) 
      name = pokemon[1]
      type = pokemon[2]
      hp = pokemon [3]
   Pokemon.new_from_db(id: id, name: name, type: type, hp: hp, db: database_connection)
  end 
end
