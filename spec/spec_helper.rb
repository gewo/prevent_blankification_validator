require 'simplecov'
require 'coveralls'

SimpleCov.start do
  add_filter "/spec"
end

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter[
  SimpleCov::Formatter::HTMLFormatter,
  Coveralls::SimpleCov::Formatter
]

SimpleCov.at_exit do
  File.open(File.join(SimpleCov.coverage_path, 'percent.txt'), 'w') do |f|
    f.write SimpleCov.result.covered_percent
  end
  SimpleCov.result.format!
end
SimpleCov.start

require 'active_model'
require 'prevent_blankification_validator'

RSpec.configure do |config|
  config.treat_symbols_as_metadata_keys_with_true_values = true
  config.run_all_when_everything_filtered = true
  config.filter_run :focus
  config.order = 'random'
end
