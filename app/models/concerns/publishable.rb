module Publishable
  extend ActiveSupport::Concern

  included do
    state_machine :publish_state, initial: :unpublished do
      state :unpublished
      state :published

      event :publish do
        transition :unpublished => :published
      end

      event :hide do
        transition :published => :unpublished
      end
    end
  end
end