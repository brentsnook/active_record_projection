# frozen_string_literal: true

module ActiveRecordProjection
  class ProjectedEventRegistry
    class_attribute :event_types, default: Set.new
    class_attribute :unsubscribe_handler

    def self.register(event_types)
      self.event_types.merge(event_types)
      unsubscribe_handler&.call
      self.unsubscribe_handler = Rails.configuration.event_store.subscribe(
        EventHandlers::UpdateSubscribedProjections,
        to: self.event_types
      )
    end

    private :event_types, :event_types=, :unsubscribe_handler, :unsubscribe_handler=
  end
end
