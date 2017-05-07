require_relative("../db/sql_runner.rb")

class Animal

  attr_reader :name, :gender, :admission_date, :breed, :id, :ready_to_adopt

  def initialize(params)
    @id = params["id"].to_i if params["id"].to_i
    @name = params["name"]
    @breed = params["breed"]
    @admission_date = params["admission_date"]
    @ready_to_adopt = params["ready_to_adopt"]
  end

  def save()
    sql = "INSERT INTO animals (name, breed, admission_date, ready_to_adopt) VALUES ( '#{@name}', '#{@breed}','#{@admission_date}', '#{@ready_to_adopt}')  RETURNING id;"
    animal_details = SqlRunner.run(sql)
    @id = animal_details.first['id'].to_i    
  end

  def Animal.all()
    sql = "SELECT * FROM animals;"
    results = SqlRunner.run(sql)
    return results.map { |animals| Animal.new(animals) }
  end

  def delete()
    sql = "DELETE FROM animals WHERE id = #{@id}"
    SqlRunner.run(sql)
  end

  def Animal.delete_all()
    sql = "DELETE FROM animals;"
    SqlRunner.run(sql)
  end
  
  def update()
    sql = "UPDATE animals SET (name, breed, admission_date, ready_to_adopt) =
          ( '#{@name}', '#{@breed}','#{@admission_date}', '#{@ready_to_adopt}') 
          WHERE id = #{@id};"
    SqlRunner.run(sql)
  end

  def Animal.find(id)
    sql = "SELECT * FROM animals WHERE id=#{id};"
    animal = SqlRunner.run( sql )
    result = Animal.new(animal.first)
    return result
  end

  # def Animal.find_breed( )
  #   sql = "SELECT * FROM animals WHERE breed = #{breed};"
  #   animals = SqlRunner.run(sql)
  #   paddy = animals.map { |animal| Animal.new(animal)}
  #   return paddy
  # end

#   def Animal.find_breed(breed)
#     sql = "SELECT * FROM animals WHERE breed= '#{@breed};"
#     results = SqlRunner.run(sql)
#     all_animals = Animal.all
#     results.select { |}
#   end


# all_critters = Animal.all and then all_critters.select {|critter| critter.breed == target_breed }


 
#  def Animal.find_breed(breed)
#   sql = "SELECT * FROM animals WHERE breed= '#{@breed};"
#   animal_array = Animal.all
  

# end

  


  
    

  
end