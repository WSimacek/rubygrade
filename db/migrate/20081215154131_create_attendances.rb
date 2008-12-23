class CreateAttendances < ActiveRecord::Migration
  def self.up
    create_table :attendances do |t|
      t.date :attendance_date
      t.integer :course_id
      t.integer :category_id
      t.timestamps
    end
  end

  def self.down
    drop_table :attendances
  end
end
