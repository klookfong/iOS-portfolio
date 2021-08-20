require_relative "card"

class Board
    attr_accessor :cards, :won
    def initialize(size)
        @cards = self.populate(size)
    end

    def populate(size)
        alphabet = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZŒ∑®†ÁØ∏ÒÔÓ©ÏÎÍÅ≈Ç√ÂŒ‰ÁØ∏ÒÔÓ".split("") #array of the alphabet
        uniques = []
        ((size*size)/2).times do |t|
            n = rand(0...alphabet.length)
            letter = alphabet[n]
            alphabet.delete_at(n) #removing from array to not have multiple
            card = Card.new(letter)
            uniques << card
        end
        dupe = []
        uniques.each { |ele| dupe << ele.dup } 
        uniques = uniques.shuffle!
        arr = []
        uniques.length.times do |t|
            n = rand(0...uniques.length)
            ele = uniques[n]
            uniques.delete_at(n) #removing from array to not have multiple 
            if arr.length == 0
                arr << [ele]
            elsif arr[-1].length == size
                arr << [ele]
            else
                arr[-1] << ele
            end
        end
        dupe.length.times do |t|
            n = rand(0...dupe.length)
            ele = dupe[n]
            dupe.delete_at(n) #removing from array to not have multiple 
            if arr.length == 0
                arr << [ele]
            elsif arr[-1].length == size
                arr << [ele]
            else
                arr[-1] << ele
            end
        end
        arr
    end

    def render
        @cards.each_with_index do |row, i|
            if i == 0
                print "  "
                row.each_with_index do |ele, k|
                    print "#{k} "
                end
                puts 
            end
            print "#{i} "
            row.each_with_index do |ele, j|
                print "#{ele.to_s} "
            end
            puts
        end
    end

    def won?
        @cards.all? { |row| row.all? { |card| card.show }   }
    end

    def guess(row, col, prev_row=nil, prev_col=nil)
        return nil if @cards[row][col].show
        if prev_col.nil? || prev_row.nil?
            @cards[row][col].reveal
            return true
        end
        if @cards[row][col] != @cards[prev_row][prev_col]
            @cards[row][col].reveal
            self.render
            sleep(0.5)
            puts "\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n"
            @cards[row][col].hide
            @cards[prev_row][prev_col].hide
            self.render
            return false 
        end
        @cards[row][col].reveal
        @cards[prev_row][prev_col].reveal
        return true

    end

    def length
        @cards.length
    end

    def cheat
        @cards.map { |row| row.map { |card| card.reveal }  }
    end
    def uncheat
        @cards.map { |row| row.map { |card| card.hide }  }
    end
end

