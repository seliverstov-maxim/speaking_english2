class Film < ActiveRecord::Base
  include Taggable

  has_many :video_files, class_name: 'VideoFile'
  has_many :sub_files, class_name: 'SubFile'

  include Removable
end