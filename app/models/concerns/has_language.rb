module HasLanguage
  extend ActiveSupport::Concern

  included do
    has_many :lang_relations, :as => :target
    has_many :langs, :through => :lang_relations, :as => :target
  end
end