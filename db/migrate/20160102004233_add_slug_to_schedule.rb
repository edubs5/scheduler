class AddSlugToSchedule < ActiveRecord::Migration
  def change
    add_column :schedules, :slug, :string, unique: true
    add_index :schedules, :slug
  end
end
