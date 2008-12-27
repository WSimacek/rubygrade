class CreateAssignments < ActiveRecord::Migration
  def self.up
    create_table :assignments do |t|
      t.string :name
      t.integer :course_id
      t.integer :category_id
      t.float :max_grade
      t.float :grade_boundary1, :default => "90"
      t.float :grade_boundary2, :default => "80"
      t.float :grade_boundary3, :default => "70"
      t.float :grade_boundary4, :default => "60"
      t.float :grade_boundary5, :default => "50"
      t.float :grade_boundary6, :default => "40"
      t.float :grade_boundary7, :default => "30"
      t.string :grade_level1, :default => "A"
      t.string :grade_level2, :default => "B"
      t.string :grade_level3, :default => "C"
      t.string :grade_level4, :default => "D"
      t.string :grade_level5, :default => "E"
      t.string :grade_level6, :default => "F"
      t.string :grade_level7, :default => "Near miss"
      t.string :grade_level8, :default => "Fail"

      t.timestamps
    end
  end

  def self.down
    drop_table :assignments
  end
end 
