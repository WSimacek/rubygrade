class CreateRegistrations < ActiveRecord::Migration
  def self.up
    create_table :registrations do |t|
      t.integer :student_id
      t.integer :attendance_id
      t.integer :presence

      t.timestamps
    end
  end

  def self.down
    drop_table :registrations
  end
end
