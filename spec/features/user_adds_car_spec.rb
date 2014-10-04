require "rails_helper"

feature "user adds car", %{
  As a car salesperson
  I want to record a newly acquired car
  So that I can list it in my lot

  Acceptance Criteria:

  I must specify the manufacturer, color, year,
    and mileage of the car.
  Only years from 1920 and above can be specified.
  I can optionally specify a description of the car.
  If I enter all of the required information
    in the required formats, the car is recorded
    and I am presented with a notification of success
  If I do not specify all of the required information
    in the required formats, the car is not recorded
    and I am presented with errors.
  Upon successfully creating a car,
    I am redirected back to the index of cars.
  } do
  scenario "user specifies manufacturer, color, year, mileage"
  scenario "car year is not before 1920"
  scenario "car has optional description"
  scenario "user successfully creates car"
  scenario "user is unsuccessful at creating car"
  scenario "user is redirected to car index"
end
