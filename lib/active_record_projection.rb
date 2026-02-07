# frozen_string_literal: true

require 'active_record_projection/mixin'

module ActiveRecordProjection
  def self.included(clazz)
    clazz.include(Mixin)
  end
end
