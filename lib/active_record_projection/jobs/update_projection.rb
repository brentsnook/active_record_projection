require 'active_record_projection/models/projection'

module ActiveRecordProjection
  module Jobs
    class UpdateProjection < ActiveJob::Base
      def perform(id:)
        Models::Projection.find(id).update_projection!
      end
    end
  end
end