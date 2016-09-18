class CreateLocationsTeamMembers < ActiveRecord::Migration
  def change
    create_table :locations_team_members, id: false do |t|
      t.belongs_to :location, index: true
      t.belongs_to :team_member, index: true
    end
  end
end
