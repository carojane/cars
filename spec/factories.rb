FactoryGirl.define do
  factory :manufacturer do
    name "Volkswagen"
    country "Germany"
  end

  factory :car do
    manufacturer
    color "red"
    year "1991"
    mileage "100,000"
    description "cabriolet"
  end
end
