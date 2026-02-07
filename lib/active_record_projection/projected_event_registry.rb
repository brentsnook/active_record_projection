# frozen_string_literal: true

module ActiveRecordProjection
  class ProjectedEventRegistry
    @event_types = Set.new
    cattr_accessor :event_types, :unsubscribe_handler

    def self.register(event_types)
      self.event_types.merge(event_types)
      unsubscribe_handler&.call
      self.unsubscribe_handler = Rails.configuration.event_store.subscribe(
        EventHandlers::UpdateSubscribedProjections,
        to: self.event_types
      )
    end
  end
end
