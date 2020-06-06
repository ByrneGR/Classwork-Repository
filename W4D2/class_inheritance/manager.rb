#require_relative "./employee.rb"

class Employee

  attr_reader :salary

  def initialize(name, salary, title, boss = nil)
    @name = name
    @title = title
    @salary = salary
    @boss = boss
    @boss.employees << self unless boss.nil?
  end
  
  def bonus(multiplier)
    self.salary * multiplier
  end

end

class Manager < Employee
  attr_accessor :employees
  def initialize(name, salary, title, boss = nil)
    @employees = []
    super
  end

  def inherit_employees
    original_employees = self.employees #The first state of employees (Ned's employees)
    original_employees.each do |employee| 
      if employee.is_a?(Manager) 
        self.employees += employee.employees #add all of Ned's employees' employees to Ned's employees
      end
    end
    self.employees.uniq
  end

  def bonus(multiplier)
    @employees.map(&:salary).sum * multiplier
  end
  
end


# Ned	\$1,000,000	Founder	nil
# Darren	\$78,000	TA Manager	Ned
# Shawna	\$12,000	TA	Darren
# David	\$10,000	TA	Darren

ned = Manager.new("Ned", 1000000, "Founder")
darren = Manager.new("Darren", 78000, "TA Manager", ned)
shawna = Employee.new("Shawna", 12000, "TA", darren)
david = Employee.new("David", 10000, "TA", darren)
ned.inherit_employees
# p ned
# p darren
# p shawna
# p david

# p ned.employees
# p darren.employees

p ned.bonus(5)
p darren.bonus(4)
p david.bonus(3)