# frozen_string_literal: true

module Liquid
  module Rails
    module TranslateFilter
      def translate(key, options = {})
        options = { 'locale' => ::I18n.locale.to_s }.merge(options)

        @context.registers[:view].translate(key.to_s, **options.symbolize_keys)
      end
      alias t translate
    end
  end
end

Liquid::Template.register_filter Liquid::Rails::TranslateFilter
