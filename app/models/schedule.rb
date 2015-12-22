class Schedule < ActiveRecord::Base
  belongs_to :user
  validates :start_date, :end_date, :user, presence: true
end
