require "employee"

class Startup
    attr_reader :name, :funding, :salaries, :employees
    def initialize(name, funding, salaries)
        @name = name
        @funding = funding
        @salaries = salaries
        @employees = []
    end
    def valid_title?(title)
        @salaries.has_key?(title)
    end

    def >(startup)
        self.funding > startup.funding
    end

    def hire(name, title)
        if !self.valid_title?(title)
            raise StandardError.new "Title is not valid!"
        else
            temp = Employee.new(name, title)
            employees << temp
        end
    end

    def size
        employees.length
    end

    def pay_employee(temp)
        salary = @salaries[temp.title]
        if @funding >= salary
            temp.pay(salary)
            @funding -= salary
        else
            raise StandardError.new "Not enough funding :("
        end
    end

    def payday
        @employees.each { |emp| self.pay_employee(emp) }
    end

    def average_salary
        total = 0
        emps = 0
        @employees.each do |emp|
            total += @salaries[emp.title]
            emps += 1
        end
        total/emps
    end

    def close
        @employees = []
        @funding = 0
    end

    def acquire(startup)
        @funding += startup.funding
        @salaries = startup.salaries.merge(@salaries)
        startup.employees.each { |emp| @employees << emp }
        startup.close
    end

end
