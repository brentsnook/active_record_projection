require 'active_record_projection/models/projection'
require 'active_record_projection/projected_event_registry'

module ActiveRecordProjection
  module Mixin
    extend ActiveSupport::Concern

    included do
      include AggregateRoot
      has_one :projection, class_name: 'ActiveRecordProjection::Models::Projection', as: :record

      delegate :last_event_id, :last_event_id=, :stream, to: :projection, allow_nil: true
      after_initialize :add_projection, :initialize_transient

      def self.on(*event_klasses, &block)
        ProjectedEventRegistry.register(event_klasses)
        super(*event_klasses, &block)
      end
    end

    # the update needs to happen from this end to ensure that
    # the correct projection is saved - the one updated
    # as unseen events are applied
    def update_projection!
      apply_unseen
        
      ActiveRecord::Base.transaction do
        save!
        projection.save!
      end
    end

    private

    def apply_unseen
      query = Rails.configuration.event_store.read.stream(stream)
      query = last_event_id ? query.from(last_event_id) : query
      query.reduce do |_, ev|
        apply(ev)
        self.last_event_id = ev.event_id
      end
    end

    def add_projection
      self.projection ||= Models::Projection.new(
        record: self,
        stream: get_stream
      )
    end

    def initialize_transient
      # this sets the variables at https://github.com/RailsEventStore/rails_event_store/blob/c2df01c4ac5d974e127b95b8d9eea21b7bebbad0/aggregate_root/lib/aggregate_root.rb#L35
      # #new is not called when an AR model is loaded
      # there must be a better way to use the module directly instead to avoid repeating
      instance_variable_set(:@version, -1)
      instance_variable_set(:@unpublished_events, [])
    end
  end
end