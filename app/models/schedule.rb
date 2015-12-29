class Schedule < ActiveRecord::Base
  belongs_to :user
  validates :start_date, :end_date, :user_id, :name, presence: true
  belongs_to :location
end
