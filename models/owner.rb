require_relative("../db/sql_runner.rb")

class Owner

  attr_reader :name, :location, :id
   
  def initialize(params)
    @name = params["name"]
    @location = params["location"]
    @id = params["id"].to_i if params["id"].to_i
  end

  def save
    sql = "INSERT INTO owners ( name, location ) VALUES ( '#{@name}', '#{@location}' ) RETURNING *"
    results = SqlRunner.run(sql)
    return results.first['id'].to_i 
  end

end