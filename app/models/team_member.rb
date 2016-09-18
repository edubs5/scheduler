class TeamMember < ActiveRecord::Base
  belongs_to :user
  has_and_belongs_to_many :locations, join_table: :locations_team_members
  validates :first_name, :last_name, :user, presence: true

  def name
    "#{first_name} #{last_name}"
  end
end
