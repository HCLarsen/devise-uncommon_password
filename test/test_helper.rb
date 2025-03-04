require File.expand_path("../../test/dummy/config/environment.rb", __FILE__)
ActiveRecord::Migrator.migrations_paths = [File.expand_path("../../test/dummy/db/migrate", __FILE__)]
require "rails/test_help"
require "rails/test_unit/reporter"
require "minitest/reporters"

# Filter out Minitest backtrace while allowing backtrace from other libraries
# to be shown.
Minitest.backtrace_filter = Minitest::BacktraceFilter.new

if ENV["CI"] # Enable the JUnit reporter only in CI
  Minitest::Reporters.use!(
    Minitest::Reporters::JUnitReporter.new("test-reports")
  )
end

Rails::TestUnitReporter.executable = 'bin/test'
