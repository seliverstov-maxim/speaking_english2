FactoryGirl.define do
  factory :film do
    title { generate :string }
    description { generate :string }
  end
end