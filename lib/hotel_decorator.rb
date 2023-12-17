
class HotelDecorator
    # hi
  end

 class BasicRoom
    def initialize(size, amenities)
        @size = size        # Size of the room in meters
        @amenities = amenities  # List of amenities as an array
    end

    def size
        @size
    end

    def amenities
        @amenities
    end
end

class DecoratedRoom < BasicRoom
    def initialize(basic_room)
        @basic_room = basic_room
        super(@basic_room.size, @basic_room.amenities)
    end

    def description
        if size > 300 && amenities.include?("sea view")
            "Luxurious spacious room with a beautiful sea view."
        elsif size > 200
            "Comfortable and roomy, perfect for a relaxing stay."
        else
            "Cozy room, ideal for short stays."
        end
    end
end

# Create an instance of BasicRoom
basic_room = BasicRoom.new(250, ["WiFi", "TV"])

# Decorate the basic_room with additional functionality
decorated_room = DecoratedRoom.new(basic_room)

# Output the description of the decorated room
puts decorated_room.description 

