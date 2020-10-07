require "bundler/setup"
require "DOF"
require 'simplecov'
require 'webmock/rspec'

SimpleCov.start { add_filter '/spec/' }

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = ".rspec_status"

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end

  config.before(:all) do
    DOF.base_uri = 'https://sidofqa.segob.gob.mx/dof/sidof/'
  end
end
