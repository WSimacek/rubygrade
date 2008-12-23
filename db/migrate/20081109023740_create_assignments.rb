class CreateAssignments < ActiveRecord::Migration
  def self.up
    create_table :assignments do |t|
      t.string :name
      t.integer :course_id
      t.integer :category_id
      t.float :max_grade
      t.float :grade_boundary1
      t.float :grade_boundary2
      t.float :grade_boundary3
      t.float :grade_boundary4
      t.float :grade_boundary5
      t.float :grade_boundary6
      t.float :grade_boundary7
      t.float :grade_boundary8
      t.string :grade_level1
      t.string :grade_level2
      t.string :grade_level3
      t.string :grade_level4
      t.string :grade_level5
      t.string :grade_level6
      t.string :grade_level7
      t.string :grade_level8

      t.timestamps
    end
  end

  def self.down
    drop_table :assignments
  end
end 
