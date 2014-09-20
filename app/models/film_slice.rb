class FilmSlice < ActiveRecord::Base
  include Taggable

  belongs_to :film

  include Removable
end