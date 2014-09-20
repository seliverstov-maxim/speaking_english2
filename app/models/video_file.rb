class VideoFile < ActiveRecord::Base
  belongs_to :film
  belongs_to :lang

  include Removable
end