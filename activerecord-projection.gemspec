Gem::Specification.new do |s|
  s.name = 'activerecord-projection'
  s.version = '0.0.1'
  s.summary = 'Persistent, automatically updated ActiveRecord projections for Rails Event Store'
  s.description = 'Builds Rails Event Store AggregateRoot'
  s.authors = ['Brent Snook']
  s.email = 'brent@fuglylogic.com'
  s.homepage = 'https://github.com/brentsnook/activerecord-projection'
  s.license = 'MIT'
  s.required_rubygems_version = '>= 3.1'

  s.files = Dir['lib/**/*', 'README.md']

  s.add_dependency 'aggregate_root'
  s.add_dependency 'activerecord'
  s.add_dependency 'activesupport'
  s.add_dependency 'rails_event_store'
end