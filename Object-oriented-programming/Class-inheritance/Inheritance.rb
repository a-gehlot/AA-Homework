class Employee

    attr_accessor :boss
    attr_reader :salary

    def initialize(name, title, salary, boss = nil)
        @name = name
        @title = title
        @salary = salary
        self.boss = boss
    end

    def self.boss=(name)
        @boss = name

        @boss.add_employee(self) unless @boss.nil?
    end

    def bonus(multiplier)
        @salary * multiplier
    end
end

class Manager < Employee
    def initialize(name, title, salary, boss = nil)
        super
        @employees = []
    end

    def add_employee(employee)
        @employees << employee
        employee.boss = self
    end

    def bonus(multiplier)
        self.sub_salary * multiplier
    end

    def sub_salary
        salary = 0
        @employees.each do |employee|
            if employee.is_a?(Manager)
                salary += employee.salary + employee.sub_salary
            else
                return employee.salary
            end
        end

        salary
    end

end

a = Employee.new("a", "m", 10)
b = Manager.new("b", "m", 15)
c = Manager.new("c", "n", 20)
c.add_employee(b)
b.add_employee(a)

p a.bonus(1.5)
p c.sub_salary
    
    