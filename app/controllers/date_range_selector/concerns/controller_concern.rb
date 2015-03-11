module DateRangeSelector
  module Concerns
    module ControllerConcern
      extend ActiveSupport::Concern

      included do
        helper_method :date_range_selector
      end

      def date_range_selector
        @date_range_selector ||= DateRangeSelector::ViewModel.new(self)
      end
    end
  end
end
