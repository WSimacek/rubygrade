class Gradation < ActiveRecord::Base
belongs_to :course
belongs_to :assignment
belongs_to :student
validates_presence_of :assignment_id, :student_id, :course_id 

# turns the grade value into a percent
def grade_hash
  @grade_hash = self.grade / self.assignment.max_grade * 100 
end

#checks the percent above against the grade boundaries and then prints the level
def grade_level
 @grade_level = case self.grade_hash
                when self.assignment.grade_boundary1..100: self.assignment.grade_level1
                when self.assignment.grade_boundary2..self.assignment.grade_boundary1: self.assignment.grade_level2
                when self.assignment.grade_boundary3..self.assignment.grade_boundary2: self.assignment.grade_level3
                when self.assignment.grade_boundary4..self.assignment.grade_boundary3: self.assignment.grade_level4
                when self.assignment.grade_boundary5..self.assignment.grade_boundary4: self.assignment.grade_level5
                when self.assignment.grade_boundary6..self.assignment.grade_boundary5: self.assignment.grade_level6
                when self.assignment.grade_boundary7..self.assignment.grade_boundary6: self.assignment.grade_level7
                when self.assignment.grade_boundary8..self.assignment.grade_boundary7: self.assignment.grade_level8 
                else "N/A"
                end 


end
end



  


