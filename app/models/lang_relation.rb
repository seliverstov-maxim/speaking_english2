class LangRelation < ActiveRecord::Base
  belongs_to :lang
  belongs_to :target, :polymorphic => true
end