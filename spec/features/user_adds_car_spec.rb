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
  before :each do
    visit cars_path
    click_on "New Car"
  end

  scenario "user specifies manufacturer, color, year, mileage" do
    select "Volkswagen", from: "Manufacturer"
    fill_in "Color", with: "Red"
    select "1991", from: "Year"
    fill_in "Mileage", with: "100,000"
    click_on "Create Car"
  end

  scenario "car year is not before 1920" do
    select "Ford", from: "Manufacturer"
    fill_in "Color", with: "Black"
    select "1901", from: "Year"
    fill_in "Mileage", with: "unknown"
    click_on "Create Car"
    expect(page).to have_content("")
  end

  scenario "car has optional description" do
    select "Volkswagen", from: "Manufacturer"
    fill_in "Color", with: "Red"
    select "1991", from: "Year"
    fill_in "Mileage", with: "100,000"
    fill_in "Description", with: "Cabriolet"
    click_on "Create Car"
  end

  scenario "user successfully creates car" do
    select "Volkswagen", from: "Manufacturer"
    fill_in "Color", with: "Red"
    select "1991", from: "Year"
    fill_in "Mileage", with: "100,000"
    click_on "Create Car"
    expect()
  end

  scenario "user is unsuccessful at creating car" do
  end

  scenario "user is redirected to car index" do
  end
end
