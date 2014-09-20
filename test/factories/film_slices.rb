FactoryGirl.define do
  factory :film_slice do
    title { generate :string }
    description { generate :string }
  end
end