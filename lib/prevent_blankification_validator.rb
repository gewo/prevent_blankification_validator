require 'active_support/i18n'
require "prevent_blankification_validator/version"
require 'active_model/validations/prevent_blankification_validator'

module PreventBlankificationValidator
end

I18n.load_path += Dir[File.expand_path(File.join(File.dirname(__FILE__),
                                                 '../locales', '*.yml')).to_s]
