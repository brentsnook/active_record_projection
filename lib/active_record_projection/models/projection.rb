# frozen_string_literal: true

module ActiveRecordProjection
  module Models
    class Projection < ActiveRecord::Base
      delegate :update_projection!, to: :record

      self.table_name = :active_record_projection_projections

      belongs_to :record, polymorphic: true
    end
  end
end
