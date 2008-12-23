class Category < ActiveRecord::Base
has_many :attendances
has_many :assignments
belongs_to :user
end
