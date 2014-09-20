class Lesson < ActiveRecord::Base
  has_many :film_slice_lessons
  has_many :film_slices, through: :film_slice_lessons

  include Removable
end