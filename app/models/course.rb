class Course < ActiveRecord::Base
has_many :attendances, :dependent => :destroy
has_many :categories, :through => :assignments, :uniq => true
has_many :enrollments, :dependent => :destroy
has_many :students, :through => :enrollments
has_many :assignments, :dependent => :destroy
has_many :gradations, :dependent => :destroy
belongs_to :user
validates_presence_of :name
validates_uniqueness_of :name, :scope => :user_id
validates_associated :students

  
 
  
end

