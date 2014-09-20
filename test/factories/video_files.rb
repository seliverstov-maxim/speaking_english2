FactoryGirl.define do
  factory :video_file do
    url { generate :string }
  end
end