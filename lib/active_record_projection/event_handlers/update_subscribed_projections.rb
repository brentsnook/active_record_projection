# frozen_string_literal: true

# don't require this file, RailsEventStore::AsyncHandler requires rails to be configured first

require 'active_record_projection/jobs/update_projection'
require 'active_record_projection/models/projection'

module ActiveRecordProjection
  module EventHandlers
    class UpdateSubscribedProjections < ActiveJob::Base
      prepend RailsEventStore::AsyncHandler

      def perform(event)
        streams = Rails.configuration.event_store.streams_of(event.event_id).map(&:name)
        Models::Projection.where(stream: streams).pluck(:id).each do |id|
          Jobs::UpdateProjection.perform_later(id:)
        end
      end
    end
  end
end
