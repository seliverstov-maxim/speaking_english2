FactoryGirl.define do
  factory :lesson do
    title { generate :string }
    description { generate :string }
  end
end