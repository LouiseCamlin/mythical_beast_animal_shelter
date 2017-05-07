require_relative("../db/sql_runner.rb")
require_relative("./animal.rb")

class Owner

  attr_reader :name, :location, :id, :animal_id
   
  def initialize(params)
    @id = params["id"].to_i if params["id"].to_i
    @name = params["name"]
    @location = params["location"]
    @animal_id = params["animal_id"].to_i
  end

  def save()
    sql = "INSERT INTO owners ( name, location, animal_id) VALUES ( '#{@name}', '#{@location}', #{@animal_id} ) RETURNING *;"
    results = SqlRunner.run(sql)
    return results.first['id'].to_i 
  end

  def all()
    sql = "SELECT * FROM owners;"
    results = SqlRunner.run( sql )
    return results.map { |hash| Owner.new( hash ) }
  end

  def delete()
    sql = "DELETE FROM owners WHERE id = #{@id}"
    SqlRunner.run(sql)
  end

  def Owner.delete_all()
    sql = "DELETE FROM owners;"
    SqlRunner.run(sql)
  end

  def update()
    sql = "UPDATE owners SET ( name, location, animal_id) = ( '#{@name}', '#{@location}', #{@animal_id} ) WHERE id = #{@id};"
    SqlRunner.run(sql)
  end

  def animal
    sql = "SELECT * FROM animals
    WHERE id = #{@animal_id};"
    results = SqlRunner.run(sql)
    animal_hash = results.first
    animal_object = Animal.new(animal_hash)
    return animal_object
  end




end