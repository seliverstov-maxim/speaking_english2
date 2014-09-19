class Film::SubFile < ActiveRecord::Base
  belongs_to :film
  belongs_to :lang
end