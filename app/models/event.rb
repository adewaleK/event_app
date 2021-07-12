class Event < ApplicationRecord

    
    validates :title, presence: true
    validates :title, length: {minimum: 5}, allow_blank: true
    validates :description, presence: true
    validates :title, length: {minimum: 5}, allow_blank: true
    validates :location, presence: true
    validates :date, presence: true
    validates :plan, presence: true
    

    scope :inactive, -> { where('date < ?', Date.today) }
    scope :active, -> { where('date >= ?', Date.today) }
end
