module Removable
  extend ActiveSupport::Concern

  included do
    state_machine :state, initial: :active do
      state :active
      state :deleted

      event :restore do
        transition :deleted => :active
      end

      event :mark_as_deleted do
        transition :active => :deleted
      end

      before_transition deleted: :active, do: :clear_deleted_at
      before_transition active: :deleted, do: :set_deleted_at
    end

    private

    def set_deleted_at
      self.deleted_at = Time.current
    end

    def clear_deleted_at
      self.deleted_at = nil
    end
  end
end