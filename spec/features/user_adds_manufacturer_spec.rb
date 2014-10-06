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

  scenario "user does not provide required attributes" do
    make_count = Manufacturer.count
    expect { click_on "Create" }.to change { make_count }.by(0)
    expect(page).to have_content("can't be blank")
  end

  scenario "user successfully creates manufacturer" do
    fill_in "Name", with: "Volkswagon"
    select "Germany", from: "Country"
    expect { click_on "Create" }.to change { Manufacturer.count }.by(1)
    expect(page).to have_content("Manufacturer successfully created.")
    expect(page).to have_content("Volkswagon")
  end
end
