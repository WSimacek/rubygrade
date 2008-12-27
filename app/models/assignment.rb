class Assignment < ActiveRecord::Base
belongs_to :category
belongs_to :course
has_many :gradations, :dependent => :destroy
has_many :students, :through => :gradations, :uniq => true
validates_presence_of :course_id

after_create :build_gradations

def build_gradations
  self.course.students.each do |student|
      Gradation.create(:assignment_id => self.id, :student_id =>
student.id, :course_id => self.course.id)
    end
  end


 
 def new_gradation_attributes=(gradation_attributes)
  gradation_attributes.each do |attributes|
        gradations.build(attributes)
  end
end

after_update :save_gradations
  
  def existing_gradation_attributes=(gradation_attributes)
    gradations.reject(&:new_record?).each do |gradation|
      attributes = gradation_attributes[gradation.id.to_s]
      if attributes
        gradation.attributes = attributes
      else
        gradations.delete(gradations)
      end
    end
  end
  
  def save_gradations
    gradations.each do |gradation|
      gradation.save(false)
    end
  end
end  


 
