class Enrollment < ActiveRecord::Base
belongs_to :student
belongs_to :course
validates_presence_of :student_id, :course_id 
end
