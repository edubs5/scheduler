class CreateSchedules < ActiveRecord::Migration
  def change
    create_table :schedules do |t|
      t.integer :user_id
      t.integer :location_id
      t.date    :start_date
      t.date    :end_date
      t.string  :name

      t.timestamps
    end
  end
end

