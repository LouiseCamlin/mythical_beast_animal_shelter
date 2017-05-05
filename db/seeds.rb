require("pry-byebug")
require_relative("../models/animal.rb")
require_relative("../models/owner.rb")

animal1 = Animal.new({
  'name' => "Drogon",
  'age' => 6,
  'gender' => "male",
  'admission_date' => "March 12 2017",
  'breed' => "dragon"
  })
animal1.save

owner1 = Owner.new({
  'name' => "Daenerys Targaryen",
  'location' => "Essos"
  })
owner1.save

binding.pry
nil