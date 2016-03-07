FactoryGirl.define do
  factory :schedule, class: Schedule do
    name "test schedule"
    start_date "3/1/2016".to_date
    end_date "31/1/2016".to_date
    user_id 1
    location_id 1
  end
end
