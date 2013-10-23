class Student

  def learn
    puts "I get it!"
  end

end

class Instructor 

  def teach
    puts "Everything in Ruby is an Object"
  end

end 


check1 = Student.new
check1.learn

check2 = Instructor.new
check2.teach
