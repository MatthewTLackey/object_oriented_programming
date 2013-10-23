class Person
  attr_accessor :name

  def initialize(name)
    @name = name
  end

  def greeting
    puts "Hi my name is #{@name}"
  end
end

class Student < Person

  # def initialize(name)
  #   super
  # end


  def learn
    puts "I get it!"
  end

end

class Instructor < Person

  # def initialize(instructor_name)
  #   super
  # end

  def teach
    puts "Everything in Ruby is an Object"
  end

end 



teacher_chris = Instructor.new("Chris")
teacher_chris.greeting
student_cristina = Student.new("Cristina")
student_cristina.greeting


teacher_chris.teach
student_cristina.learn



#student_cristina.teach

#The Student class cannot access the teach method because the
#teach method is in the Instructor class.  This means that, since 
#nothing has been done to give the Student class access to the
#Instructor class, as far as the Student class can tell, the teach
#method doesn't exist.
