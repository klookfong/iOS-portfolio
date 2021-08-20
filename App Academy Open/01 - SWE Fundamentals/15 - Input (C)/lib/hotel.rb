require_relative "room"

class Hotel
    def initialize(name, rooms)
        @name = name
        @rooms = {}
        rooms.each { |k,v| @rooms[k] = Room.new(v) }
    end
    def name
        newWord = []
        @name.split(" ").each { |word| newWord << word[0].upcase + word[1..-1].downcase }
        newWord.join(" ")
    end
    def rooms
        @rooms
    end
    def room_exists?(name)
        @rooms.has_key?(name)
    end
    def check_in(person, room)
        if !self.room_exists?(room)
            puts "sorry, room does not exist"
        else
            space_available = @rooms[room].add_occupant(person)
            if space_available
                puts "check in successful"
            else
                puts "sorry, room is full"
            end
        end
    end
    def has_vacancy?
        !@rooms.all? { |k,v| v.full? }
    end
    def list_rooms
        @rooms.each do |k,v|
            puts "#{k}: #{v.available_space}" 
        end
    end
end

