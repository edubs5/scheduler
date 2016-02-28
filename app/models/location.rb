class Location < ActiveRecord::Base
  extend FriendlyId
  friendly_id :slug_candidates, use: [:slugged, :history]

  belongs_to :user
  validates :name, :user, presence: true

  def slug_candidates
    [
      :name,
      [:name, random_string]
    ]
  end

  def random_string
    SecureRandom.urlsafe_base64(10)
  end

  def should_generate_new_friendly_id?
    name_changed? || super
  end
end
