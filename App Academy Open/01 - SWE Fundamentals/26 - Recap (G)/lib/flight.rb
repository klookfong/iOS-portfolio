class Flight
    attr_reader :passengers
    def initialize(num, cap)
        @flight_number = num
        @capacity = cap
        @passengers = []
    end
    def full?
        @passengers.length == @capacity
    end
    def board_passenger(passenger)
        return if full?
        return if !passenger.has_flight?(@flight_number)
        @passengers << passenger
    end
    def list_passengers
        arr = []
        @passengers.each { |p| arr << p.name  }
        arr
    end
    def [](idx)
        @passengers[idx]
    end
    def <<(passenger)
        board_passenger(passenger)
    end
end