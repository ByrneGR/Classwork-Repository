require_relative "./manager.rb"

class Employee

  attr_reader :salary

  def initialize(name, title, salary, boss = nil)
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