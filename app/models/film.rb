class Film < ActiveRecord::Base
  has_many :tag_relations, :as => :target
  has_many :tags, :through => :tag_relations, :as => :target

  has_many :video_files, class_name: 'VideoFile'
  has_many :sub_files, class_name: 'SubFile'

  include Removable
end