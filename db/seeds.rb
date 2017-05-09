require("pry-byebug")
require_relative("../models/animal.rb")
require_relative("../models/owner.rb")

Animal.delete_all
Owner.delete_all

animal1 = Animal.new({
  'name' => "Drogon",
  'breed' => "dragon",
  'admission_date' => "March 12 2017",
  'ready_to_adopt' => "Not Ready"
  })
animal1.save()

animal2 = Animal.new({
  'name' => "Rowlf",
  'breed' => "dog",
  'admission_date' => "March 25 2017",
  'ready_to_adopt' => "Ready"
  })
animal2.save()

owner1 = Owner.new({
  'name' => "Daenerys Targaryen",
  'location' => "Essos",
  'animal_id' => animal1.id
  })
owner1.save()

owner2 = Owner.new({
  'name' => "Jim Henson",
  'location' => "Muppet Theatre",
  'animal_id' => animal2.id
  })
owner2.save()



binding.pry
nil