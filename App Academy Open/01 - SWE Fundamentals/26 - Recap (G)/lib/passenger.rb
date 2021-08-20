class Passenger
    attr_reader :name#, :flight_numbers
    def initialize(name)
        @name = name
        @flight_numbers = []
    end
    def has_flight?(num)
        @flight_numbers.include?(num.upcase)
    end
    def add_flight(num)
        @flight_numbers << num.upcase if !has_flight?(num)
    end
end