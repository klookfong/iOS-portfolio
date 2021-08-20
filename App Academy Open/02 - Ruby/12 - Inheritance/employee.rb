class Employee
    attr_accessor :name, :title, :salary, :boss
    def initialize(name, salary, title="", boss=nil)
        @name,@title,@salary,@boss = name,title,salary,boss
    end
    def bonus(mul)
        @salary * mul
    end
end

class Manager < Employee
    attr_accessor :employees
    def initialize(name, salary, title="", boss=nil)
        super(name,salary,title,boss)
        @employees = []
    end
    def bonus(mul)
        self.total_subsalary * mul
    end
    
      protected
      
      def total_subsalary
        total_subsalary = 0
        self.employees.each do |employee|
          if employee.is_a?(Manager)
            total_subsalary += employee.salary + employee.total_subsalary
          else
            total_subsalary += employee.salary
          end
        end
    
        total_subsalary
      end
end

ned = Manager.new("Ned", 1000000, "Founder")
darren = Manager.new("Darren", 78000, "TA Manager", ned)
shawna = Employee.new("Shawna", 12000, "TA", darren)
david = Employee.new("David", 10000, "TA", darren)
ned.employees = [darren, shawna, david]
darren.employees = [shawna, david]

p ned.bonus(5) # => 500_000
p darren.bonus(4) # => 88_000
p david.bonus(3) # => 30_000
