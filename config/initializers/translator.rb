# frozen_string_literal: true

require 'google/cloud/translate'

# Contains shared instance of Google::Cloud::Translate
module Translator
  def self.translate(*args)
    instance.translate(*args)
  end

  def self.instance
    @instance ||= Google::Cloud::Translate.new
  end
end
