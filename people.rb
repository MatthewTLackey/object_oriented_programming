class Person
  attr_accessor :name

  def greeting(name)
    puts "Hi my name is #{name}"
  end
end

class Student < Person

  def learn
    puts "I get it!"
  end

end

class Instructor < Person

  def teach
    puts "Everything in Ruby is an Object"
  end

end 

#tests
check1 = Student.new
check1.learn

check2 = Instructor.new
check2.teach

check3 = Person.new
check3.greeting("Chuck")
check1.greeting("Frederico Garcia Llorca")