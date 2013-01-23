require 'active_model/validations'

module ActiveModel
  module Validations

    # This validator prevents fields that were previously set to be blanked.
    # Thus, we can allow blank fields, but once a field is set the value cannot
    # be deleted again.
    #
    # The record#attribute _must_ have dirty tracking enabled. With Mongoid all
    # Documents get that by default.
    #
    # Usage: validates :field, prevent_blankification: true
    class PreventBlankificationValidator < ActiveModel::EachValidator
      def validate_each(record, attribute, value)
        must_have_dirty_tracking_enabled!(record, attribute)

        dirty_value = record.send "#{attribute}_was"

        if value.blank? && dirty_value.present?
          record.errors.add(attribute, :cannot_be_blanked)
        end
      end

      private

      def must_have_dirty_tracking_enabled!(record, attribute)
        unless record.respond_to? "#{attribute}_was"
          raise "#{record.class.name} doesn't seem to have dirty tracking " +
            "enabled for #{attribute}!"
        end
      end
    end
  end
end
