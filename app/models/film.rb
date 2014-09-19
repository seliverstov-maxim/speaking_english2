class Film < ActiveRecord::Base
  has_many :tag_relations, :as => :target
  has_many :tags, :through => :tag_relations, :as => :target

  has_many :video_files
  has_many :sub_files
end