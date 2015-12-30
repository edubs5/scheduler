class Schedule < ActiveRecord::Base
  validates :start_date, :end_date, :user_id, :name, presence: true

  belongs_to :user
  belongs_to :location

  has_many :workdays, dependent: :destroy

  after_create :create_work_days

  def create_work_days
    start_date.upto(end_date) do |date|
      Workday.create(schedule_id: id, work_date: date)
    end
  end
end
