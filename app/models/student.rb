class Student < ActiveRecord::Base
belongs_to :user
has_many :registrations, :dependent => :destroy
has_many :attendances, :through => :registrations, :dependent => :destroy
has_many :enrollments, :dependent => :destroy
has_many :courses, :through => :enrollments
has_many :assignments, :through => :courses
has_many :assignments, :through => :gradations
has_many :gradations, :dependent => :destroy
validates_presence_of :first_name, :last_name 

attr_accessor :course_ids
  after_save :update_courses

    #after_save callback to handle group_ids
      def update_courses
      unless course_ids.nil?
       self.enrollments.each do |e|
      e.destroy unless course_ids.include?(e.course_id.to_s)
     course_ids.delete(e.course_id.to_s)
      end 
          course_ids.each do |c|
        self.enrollments.create(:course_id => c) unless c.blank?
        @cse = Course.find(c)
          @cse.assignments.each do |assignment|
            Gradation.create(:assignment_id => assignment.id, :student_id => self.id, :course_id => c)
          end
        reload
     self.course_ids = nil
       end
   end
end


def gradation_hash
   @gradation_hash ||= gradations.index_by {|g| g.assignment_id }
end

def grade_total(cse)
 @grade_total = self.gradations.find_all_by_course_id(cse).sum { |gradation| gradation.grade_hash } / self.assignments.find_all_by_course_id(cse).length 
end
def registration_hash
  @registration_hash ||= registrations.index_by {|r| r.attendance_id}
end


end
