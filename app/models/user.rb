class User < ActiveRecord::Base
  has_many :courses
  has_many :enrollments
  has_many :enrolled_courses, through: :enrollments, source: :course
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :oxmniauthable
  devise :database_authenticatable, :registerable

  def enrolled_in?(course)
    return enrolled_courses.include?(course)
    end
end
