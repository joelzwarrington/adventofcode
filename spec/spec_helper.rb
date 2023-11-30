# frozen_string_literal: true

Dir[File.join(File.dirname(__FILE__), "..", "challenges", "shared", "**", "*.rb")].each do |file|
  require file
end

Dir[File.join(File.dirname(__FILE__), "..", "challenges", "20*", "**", "*.rb")].each do |file|
  require file
end

RSpec.configure do |config|
  config.expect_with(:rspec) do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with(:rspec) do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups

  config.filter_run_when_matching(:focus)

  # Limits the available syntax to the non-monkey patched syntax that is
  # recommended. For more details, see:
  # https://rspec.info/features/3-12/rspec-core/configuration/zero-monkey-patching-mode/
  config.disable_monkey_patching!

  if config.files_to_run.one?
    config.default_formatter = "doc"
  end

  Kernel.srand(config.seed)
end
