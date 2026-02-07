# frozen_string_literal: true

module ActiveRecordProjection
  class Railtie < ::Rails::Railtie
    config.after_initialize do
      # the prepend RailsEventStore::AsyncHandler in the handlers
      # requires that rails event store has been configured first
      require 'active_record_projection/event_handlers'
    end
  end
end
