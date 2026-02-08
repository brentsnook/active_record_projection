# frozen_string_literal: true

require 'active_record_projection/mixin'
require 'active_record_projection/railtie'

module ActiveRecordProjection
  def self.included(clazz)
    clazz.include(Mixin)
  end
end
