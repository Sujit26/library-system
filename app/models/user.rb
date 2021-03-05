class User < ApplicationRecord
    has_many:booking_cards,
    dependent: :destroy
end
