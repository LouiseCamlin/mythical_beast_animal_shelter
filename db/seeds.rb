require("pry-byebug")
require_relative("../models/animal.rb")
require_relative("../models/owner.rb")
#require_relative("../models/adoption.rb")


Animal.delete_all()
Owner.delete_all()

animal1 = Animal.new({
  'name' => "Drogon",
  'gender' => "male",
  'admission_date' => "March 12 2017",
  'breed' => "dragon",
  'ready_to_adopt' => true
  })
animal1.save()

animal2 = Animal.new({
  'name' => "Rowlf",
  'gender' => "male",
  'admission_date' => "March 25 2017",
  'breed' => "dog",
  'ready_to_adopt' => true
  })
animal2.save()

owner1 = Owner.new({
  'name' => "Daenerys Targaryen",
  'location' => "Essos",
  })
owner1.save()

owner2 = Owner.new({
  'name' => "Jim Henson",
  'location' => "Muppet Theatre"
  })
owner2.save()

# adoption1 = Adoption.new({
#   'animal_id' => animal1.id,
#   'owner_id' => owner1.id
#   })
# adoption1.save()

binding.pry
nil