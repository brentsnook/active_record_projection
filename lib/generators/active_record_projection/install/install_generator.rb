# frozen_string_literal: true

require 'rails/generators/active_record'
require 'rails/generators/active_record/migration'

module ActiveRecordProjection
  class InstallGenerator < Rails::Generators::Base
    include ::Rails::Generators::Migration

    source_root File.expand_path('templates', __dir__)
    argument :migration_name, type: :string, default: 'create_active_record_projection_projections'

    def create_migration_file
      migration_template 'migration.rb.erb', "db/migrate/#{migration_name}.rb"
    end

    def self.next_migration_number(dirname)
      ActiveRecord::Generators::Base.next_migration_number(dirname)
    end
  end
end
