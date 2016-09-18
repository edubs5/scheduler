class CreateTeamMembers < ActiveRecord::Migration
  def change
    create_table :team_members do |t|
      t.string  :first_name
      t.string  :last_name
      t.integer :user_id

      t.timestamps
    end
  end
end
