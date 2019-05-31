# frozen_string_literal: true

require 'rails_inspector/railtie'

module RailsInspector
  class << self
    # @return [Array<Hash>]
    # @example
    # [
    #   {
    #     controller: 'controller_name_with_out_controller',
    #     action: 'action'
    #   },...
    # ]
    # if nothing routes
    # []
    def controller_with_actions
      load!
      routes
    end

    # @return [Array<String>]
    # @example
    # [
    #   'model_name',...
    # ]
    def models
      descendants.map(&:to_s).map(&:underscore).map(&:singularize).reject(&:blank?).uniq
    end

    private

    def load!
      app.eager_load!
    end

    # @return [Array<Hash>]
    # @example
    # [
    #   {
    #     controller: 'controller_name_with_out_controller',
    #     action: 'action'
    #   },...
    # ]
    # if nothing routes
    # []
    def routes
      app_routes.map(&:defaults).reject { |hsh| hsh[:controller].to_s.match?(/rails|active/) }.reject(&:blank?).uniq
    end

    def app
      Rails.application
    end

    def app_routes
      app.routes.routes
    end

    def descendants
      ApplicationRecord.descendants
    end
  end
end
