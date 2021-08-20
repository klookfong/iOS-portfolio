class Dog
    def initialize(name, breed, age, bark, favorite_foods)
        @name = name
        @breed = breed
        @age = age
        @bark = bark
        @favorite_foods = favorite_foods
    end
    def name
        @name
    end
    def breed
        @breed
    end
    def age
        @age
    end
    def bark
        ret = @bark.downcase
        ret = @bark.upcase if @age > 3
        ret
    end
    def favorite_foods
        @favorite_foods
    end
    def favorite_food?(item)
        flag = false
        @favorite_foods.each { |ele| flag = true if ele.downcase == item.downcase }
        flag
    end

    def age=(number)
        @age = number
    end
end
