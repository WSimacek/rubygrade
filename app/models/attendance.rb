class Attendance < ActiveRecord::Base
belongs_to :category
belongs_to :course
has_many :registrations
has_many :students, :through => :registrations

after_create :build_registrations

def build_registrations
  self.course.students.each do |student|
    Registration.create(:attendance_id => self.id, :student_id => student.id)
  end
end


end
