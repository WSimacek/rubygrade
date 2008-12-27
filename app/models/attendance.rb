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

def new_registration_attributes=(registration_attributes)
  registration_attributes.each do |attributes|
        registrations.build(attributes)
  end
end

after_update :save_registrations
  
  def existing_registration_attributes=(registration_attributes)
    registrations.reject(&:new_record?).each do |registration|
      attributes = registration_attributes[registration.id.to_s]
      if attributes
        registration.attributes = attributes
      else
        registrations.delete(registrations)
      end
    end
  end
  
  def save_registrations
    registrations.each do |registration|
      registration.save(false)
    end
  end


end
