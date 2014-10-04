require "rails_helper"

feature "user adds manufacturer", %{
  As a car salesperson
  I want to record a car manufacturer
  So that I can keep track of the types of cars found in the lot

  Acceptance Criteria:

  I must specify a manufacturer name and country.
  If I do not specify the required information,
    I am presented with errors.
  If I specify the required information,
    the manufacturer is recorded and I am redirected
    to the index of manufacturers
  } do
  before :each do
    visit manufacturers_path
    click_on "New Manufacturer"
  end

  scenario "user specifies name and country" do
    fill_in "Name", with: "Volkswagon"
    fill_in "Country", with: "Germany"
    click_on "Submit"
  end

  scenario "user is unsuccessful at creating manufacturer" do
    expect(click_on "Submit").to raise_error
  end

  scenario "user successfully creates manufacturer" do
    fill_in "Name", with: "Volkswagon"
    fill_in "Country", with: "Germany"
    expect(click_on "Submit").to redirect_to manufacturers_path
  end
end
