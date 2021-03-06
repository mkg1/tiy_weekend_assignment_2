require 'byebug'
require './employees.rb'
class Department
  attr_reader :dept_name, :employees
  def initialize(dept_name)
    @dept_name = dept_name
    @employees = []
  end

  def add_employee(new_employee)
    @employees << new_employee
  end

  def get_total_salaries(dept_name)
    salaries = 0
    dept_name.employees.each do |i|
      salaries = salaries + i.starting_salary
    end
    return salaries
  end

  def give_department_raise(dept_raise)
    if block_given?
      up_for_raise = @employees.select {|j| yield(j) }
    else
      up_for_raise = @employees
    end
    up_for_raise.each do |x|
      if x.performance == "Good"
        x.starting_salary += 0.5*(dept_raise / up_for_raise.length)
      elsif x.performance == "Satisfactory"
        x.starting_salary += (dept_raise / up_for_raise.length)
      end
    end
  end
end
