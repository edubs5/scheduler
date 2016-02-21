class Schedule < ActiveRecord::Base
  extend FriendlyId
  friendly_id :slug_candidates, use: [:slugged, :history]

  validates :start_date, :end_date, :user_id, :name, :location_id,
    presence: true

  belongs_to :user
  belongs_to :location

  has_many :workdays, dependent: :destroy

  after_create :create_work_days

  def create_work_days
    start_date.upto(end_date) do |date|
      Workday.create(schedule_id: id, work_date: date)
    end
  end

  def slug_candidates
    [
      :name,
      [:name, location.name],
      [:name, location.name, random_string]
    ]
  end

  def random_string
    SecureRandom.urlsafe_base64(10)
  end

  def should_generate_new_friendly_id?
    name_changed? || super
  end
end
