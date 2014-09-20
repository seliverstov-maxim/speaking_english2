module Taggable
  extend ActiveSupport::Concern

  included do
    has_many :tag_relations, :as => :target
    has_many :tags, :through => :tag_relations, :as => :target
  end
end