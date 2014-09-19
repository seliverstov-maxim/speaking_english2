class FilmSlice < ActiveRecord::Base
  belongs_to :film
  has_many :tag_relations, :as => :target
  has_many :tags, :through => :tag_relations, :as => :target

  include Removable
end