class Hotel < ApplicationRecord

    #validation before written to table on DB
    validates :name_room, :presence => true,
        length: {minimum: 5, message: "must have at least 5 characters"}
end
