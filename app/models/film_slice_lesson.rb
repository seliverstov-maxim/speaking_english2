class FilmSliceLesson < ActiveRecord::Base
  belongs_to :lesson
  belongs_to :film_slice
end