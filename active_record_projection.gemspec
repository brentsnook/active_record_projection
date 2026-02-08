# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'active_record_projection/version'

Gem::Specification.new do |s|
  s.name = 'active_record_projection'
  s.version = ActiveRecordProjection::VERSION
  s.summary = 'Persistent, automatically updated ActiveRecord projections for Rails Event Store'
  s.description = 'Builds Rails Event Store AggregateRoot'
  s.authors = ['Brent Snook']
  s.email = 'brent@fuglylogic.com'
  s.homepage = 'https://github.com/brentsnook/active_record_projection'
  s.license = 'MIT'
  s.required_ruby_version = '>= 3.1'
  s.required_rubygems_version = '>= 3.1'

  s.files = Dir['lib/**/*', 'README.md']

  s.add_dependency 'activerecord'
  s.add_dependency 'activesupport'
  s.add_dependency 'aggregate_root'
  s.add_dependency 'rails_event_store'

  s.metadata['rubygems_mfa_required'] = 'true'
end
