require_relative("../db/sql_runner.rb")

class Owner

  attr_reader :name, :location, :id
   
  def initialize(params)
    @name = params["name"]
    @location = params["location"]
    @id = params["id"].to_i if params["id"].to_i
  end

  def save()
    sql = "INSERT INTO owners ( name, location ) VALUES ( '#{@name}', '#{@location}' ) RETURNING *;"
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
    sql = "UPDATE owners SET ( name, location ) = ( '#{@name}', '#{@location}' ) WHERE id = #{@id};"
    SqlRunner.run(sql)
  end




end