class Lesson < ActiveRecord::Base
  include Taggable

  has_many :film_slice_lessons
  has_many :film_slices, through: :film_slice_lessons

  include Removable
end