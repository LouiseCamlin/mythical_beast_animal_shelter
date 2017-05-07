require_relative("../animal.rb")
require( 'minitest/autorun' )
require( 'minitest/emoji' )

class TestAnimal < MiniTest::Test

  def setup 
    animal1 = Animal.new({
      'name' => "Drogon",
      'gender' => "male",
      'admission_date' => "March 12 2017",
      'breed' => "dragon",
      'ready_to_adopt' => true
      })
  end


  # def test_find_breed
  #   assert_equal("dragon", find_breed(@animal1))
  # end




end

