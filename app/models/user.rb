class User < ActiveRecord::Base
  has_many :locations, dependent: :destroy
  has_many :schedules, dependent: :destroy
  has_many :team_members, dependent: :destroy

  def self.from_omniauth(auth)
    User.where(provider: auth[:provider], uid: auth[:uid]).first ||
      create_from_omniauth(auth)
  end

  def self.create_from_omniauth(auth)
    create! do |user|
      user.provider   = auth[:provider]
      user.uid        = auth[:uid]
      user.first_name = auth[:info][:first_name]
      user.last_name  = auth[:info][:last_name]
      user.email      = auth[:info][:email]
    end
  end
end
