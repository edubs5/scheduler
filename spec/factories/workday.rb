FactoryGirl.define do
  factory :workday, class: Workday do
    schedule_id (1..100).to_a.sample
    work_date "1/3/2016".to_date
  end
end
