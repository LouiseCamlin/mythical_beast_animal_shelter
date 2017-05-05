class Animal

  attr_reader :name, :age, :gender, :admission_date, :breed, :id 

  def initialize(params)
    @name = params["name"]
    @age = params["age"].to_i if params["age"].to_i
    @gender = params["gender"]
    @admission_date = params["admission_date"]
    @breed = params["breed"]
    @id = params["id"].to_i if params["id"].to_i
    
  end

  def save
    sql = "INSERT INTO animals (name, age, gender, admission_date, breed) VALUES ( '#{@name}', #{@age}, '#{@gender}', '#{@admission_date}', '#{@breed}') RETURNING *"
    results = SqlRunner.run(sql)
    return results.first['id'].to_i    
  end


    

  
end