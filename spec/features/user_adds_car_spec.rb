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
  let(:manufacturer) { FactoryGirl.create(:manufacturer) }

  before :each do
    @car = FactoryGirl.create(:car, manufacturer: manufacturer)
    visit cars_path
    click_on "New Car"
  end

  context "successful car saves" do
    before :each do
      select @car.manufacturer.name, from: "Manufacturer"
      fill_in "Color", with: @car.color
      select @car.year, from: "Year"
      fill_in "Mileage", with: @car.mileage
    end

    scenario "user specifies manufacturer, color, year, mileage" do
      expect{ click_on "Create Car" }.to change{ Car.count }.by(1)
    end

    scenario "car has optional description" do
      fill_in "Description", with: @car.description
      expect{ click_on "Create Car" }.to change{ Car.count }.by(1)
    end

    scenario "user successfully creates car" do
      expect{ click_on "Create Car" }.to change{ Car.count }.by(1)
      expect(page).to have_content("Car successfully created.")
    end

    scenario "user is redirected to car index" do
      click_on "Create Car"
      expect(page.current_path).to eq(cars_path)
    end
  end

  scenario "car year is not before 1920" do
    expect(page).to_not have_select("Year",
                                    with_options: ["1919"])
  end

  scenario "user is unsuccessful at creating car" do
      expect{ click_on "Create Car" }.to change{ Car.count }.by(0)
      expect(page).to have_content("can't be blank")
  end
end
