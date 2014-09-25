class VideoFile < ActiveRecord::Base
  include HasLanguage

  belongs_to :film_slice
  belongs_to :lang

  include Removable
end