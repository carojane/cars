class Car < ActiveRecord::Base
  belongs_to :manufacturer

  validates :color, presence: true
  validates :year,
    presence: true,
    numericality: { greater_than_or_equal_to: 1920 } # would need to change datatype to integer
  validates :mileage, presence: true
  validates :manufacturer, presence: true
end
