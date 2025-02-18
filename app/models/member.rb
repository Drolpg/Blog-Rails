class Member < ApplicationRecord
    validates :name, :age, :number, presence: true

end
