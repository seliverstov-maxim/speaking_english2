class Film::VideoFile < ActiveRecord::Base
  belongs_to :film
  belongs_to :lang
end