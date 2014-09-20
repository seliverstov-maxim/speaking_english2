class SubFile < ActiveRecord::Base
  include HasLanguage

  belongs_to :film
  belongs_to :lang

  include Removable
end