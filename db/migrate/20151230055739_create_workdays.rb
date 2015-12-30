class CreateWorkdays < ActiveRecord::Migration
  def change
    create_table :workdays do |t|
      t.belongs_to :schedule, index: true
      t.datetime :date

      t.timestamps
    end
  end
end
