class Registration < ActiveRecord::Base
belongs_to :student
belongs_to :attendance
end
