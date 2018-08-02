class Student
  attr_accessor :name, :grade, :id

  def initialize(name, grade, id=nil)
    @name = name
    @grade = grade
    @id = id

  end

  def save
    sql = <<- SQL
      INSERT INTO students (name, grade)
      VALUES (?, ?)

    SQL

    DB[:conn].execute(sql, self.name, self.grade)

  end


end
