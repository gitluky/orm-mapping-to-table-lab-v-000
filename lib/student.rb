class Student
  attr_accessor :name, :grade, :id

  def self.create_table
    sql = <<- SQL
      CREATE TABLE students (
        id INTEGER PRIMARY KEY,
        name TEXT,
        grade INTEGER
      )
    SQL
    
    DB[:conn].execute(sql)
    
  end

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
