class CreateGradations < ActiveRecord::Migration
  def self.up
    create_table :gradations do |t|
      t.integer :grade
      t.integer :student_id
      t.integer :assignment_id
      t.integer :course_id
      t.timestamps
    end
  end

  def self.down
    drop_table :gradations
  end
end
